def _test_repo_rule_impl(repository_ctx):
    print(repository_ctx.attr.string)


_test_repo_rule = repository_rule(
    implementation = _test_repo_rule_impl,
    attrs = {
        "string": attr.string(),
    }
)


def _ext_test_impl(_):
   _test_repo_rule(
    name = "test_repo_rule",
    string = "This is called...."
   )  


ext_test = module_extension(
    implementation = _ext_test_impl,
)