workspace(name = "go_bazel_workspace")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

#------------------------GO Configurations-------------------------------

#http_archive(
#    name = "io_bazel_rules_go",
#    sha256 = "56d8c5a5c91e1af73eca71a6fab2ced959b67c86d12ba37feedb0a2dfea441a6",
#    url = "https://harness-artifactory.harness.io/artifactory/rules-go-github/download/v0.37.0/rules_go-v0.37.0.zip",
#)
#
#load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
#
#go_rules_dependencies()
#
#go_register_toolchains(version = "1.19.8")
#
#http_archive(
#    name = "bazel_gazelle",
#    sha256 = "448e37e0dbf61d6fa8f00aaa12d191745e14f07c31cabfa731f0c8e8a4f41b97",
#    url = "https://harness-artifactory.harness.io/artifactory/bazel-gazelle-github/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
#)
#
#load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
#
#gazelle_dependencies()
#
#http_archive(
#    name = "com_google_protobuf",
#    sha256 = "3bd7828aa5af4b13b99c191e8b1e884ebfa9ad371b0ce264605d347f135d2568",
#    strip_prefix = "protobuf-3.19.4",
#    urls = [
#        "https://github.com/protocolbuffers/protobuf/archive/v3.19.4.tar.gz",
#    ],
#)
#
#load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
#
#protobuf_deps()

load("//tools/bazel/sonarqube:repositories.bzl", "bazel_sonarqube_repositories")

bazel_sonarqube_repositories()

#http_archive(
#    name = "io_bazel_stardoc",
#    sha256 = "6d07d18c15abb0f6d393adbd6075cd661a2219faab56a9517741f0fc755f6f3c",
#    strip_prefix = "stardoc-0.4.0",
#    urls = ["https://github.com/bazelbuild/stardoc/archive/0.4.0.tar.gz"],
#)
#
#load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
#
#stardoc_repositories()

#------------------------JAVA Configurations-------------------------------

#RULES_JVM_EXTERNAL_TAG = "4.0"
#
#RULES_JVM_EXTERNAL_SHA = "31701ad93dbfe544d597dbe62c9a1fdd76d81d8a9150c2bf1ecf928ecdf97169"
#
#http_archive(
#    name = "com_github_bazelbuild_buildtools",
#    sha256 = "932160d5694e688cb7a05ac38efba4b9a90470c75f39716d85fb1d2f95eec96d",
#    strip_prefix = "buildtools-4.0.1",
#    url = "https://harness-artifactory.harness.io/artifactory/bazel-buildtools-github/archive/refs/tags/4.0.1.zip",
#)
#
#http_archive(
#    name = "rules_cc",
#    urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.8/rules_cc-0.0.8.tar.gz"],
#    sha256 = "ae46b722a8b8e9b62170f83bfb040cbf12adb732144e689985a66b26410a7d6f",
#    strip_prefix = "rules_cc-0.0.8",
#)

#http_archive(
#    name = "rules_jvm_external",
#    sha256 = RULES_JVM_EXTERNAL_SHA,
#    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
#    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
#)
#
#load("@rules_jvm_external//:defs.bzl", "maven_install")
#
#maven_install(
#    artifacts = [
#        "junit:junit:4.12",
#    ],
#    repositories = [
#        "https://jcenter.bintray.com/",
#        "https://repo1.maven.org/maven2",
#    ],
#    maven_install_json = "//:tools/pinned-versions/maven_install.json",
#    version_conflict_policy = "pinned",
#    fetch_sources = True,
#)
#
#load("@maven//:defs.bzl", "pinned_maven_install")
#
#pinned_maven_install()
