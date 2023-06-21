load("//tools/bazel/sonarqube:defs.bzl", "sq_project")

def determine_language(srcs):
    for f_name in srcs:
        if ".java" in f_name:
            return "java"
            break
        elif ".go" in f_name:
            return "go"
            break

def exclude_tests_from_srcs(srcs):
    return [fn for fn in native.glob(srcs) if "_test" not in fn]

def sonar_prop(
        language, name = None, project_key = None,
        project_name = None, srcs = [],
        source_encoding = None, targets = [],
        test_srcs = [], test_targets = [],
        test_reports = [], modules = {},
        sq_properties_template = None, tags = [],
        visibility = []):
    if language == 'go':
        srcs = native.glob(exclude_tests_from_srcs(["*.go"]))
        targets = [":lib"]
        test_srcs = native.glob(["*_test.go"])
        test_targets = [":lib_test"]
    else:
        srcs = native.glob(["src/main/java/**/*.java"])
        targets = [":module"]
        test_srcs = native.glob(["src/test/java/**/*.java"])
        test_targets = [":moduleTest"]
    if name == None:
        name = "sq_subproject"
    if project_key == None:
        project_key = native.package_name().replace("/", ":")
    if project_name == None:
        project_name = "GO-POC :: " + native.package_name()
    if test_reports == []:
        test_reports = ["test_reports"]
    if tags == []:
        tags = ["manual", "no-ide", "sonarqube"]
    if visibility == []:
        visibility = ["//visibility:public"]

    print ("Debug Logs: " + str(native.package_name()) + " " + str(srcs) + " " + str(test_srcs) + " " + str(language))

    sq_project(
       name = name,
       language = language,
       project_key = project_key,
       project_name = project_name,
       srcs = srcs,
       targets = targets,
       test_srcs = test_srcs,
       test_targets = test_targets,
       test_reports = test_reports,
       tags = tags,
       visibility = visibility)

def run_analysis(language):
    print ("Configuring Sonar Prop File for language..... " + language)
    sonar_prop(language)

#### Java Test Targets Utils ####

TEST_PACKAGE_PATTERNS = ["src/test/java/", "src/test/"]  # needs to be ordered most specific to least specific

def run_tests_targets(srcs):
    targets = []
    test_files = native.glob([srcs])
    for idx in range(len(test_files)):
        test = normalize_path(test_files[idx])
        targets += [test]
    print ("Test Classes: " + str(targets))
    return targets

def normalize_path(path):
    for pattern in TEST_PACKAGE_PATTERNS:
        if pattern in path:  # For root level build file we have relative path from root
            return path[len(pattern):][:-5].replace("/", ".")

        # native.package_name() resolves to the package of the BUILD.bazel file that invokes the rule starting from the src root
        # e.g. Module-Name/src/test/java/io/harness/delegate/app/platform, we are interested in Java package part.
        bazel_package = native.package_name()
        class_name = path[:-5].replace("/", ".")
        if pattern in bazel_package:  # For package level build files, we have just class names
            return bazel_package.split(pattern)[1].replace("/", ".") + "." + class_name

def run_tests(srcs, **kwargs):
    targets = run_tests_targets(srcs)
    for test in targets:
        native.java_test(
            name = test,  # IntelliJ bazel plugin (mostly) assumes test target name is FQN of test class.
            runtime_deps = ["moduleTest"],
            size = "small",
            jvm_flags = [
                "-Xmx4M",
                "-XX:+HeapDumpOnOutOfMemoryError",
                "-XX:HeapDumpPath=heap.hprof",
            ],
            env = {"JAVA_HOME": "$(JAVABASE)"},
            toolchains = ["@bazel_tools//tools/jdk:current_host_java_runtime"],
            test_class = test,
            testonly = True,
            visibility = ["//visibility:private"],
            tags = ["java_test"],
            **kwargs
        )
    return targets

