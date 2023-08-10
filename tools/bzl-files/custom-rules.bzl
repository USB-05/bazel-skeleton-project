def _yamllint_impl(ctx):
    files = ctx.file.srcs
    out_file = ctx.outputs.output
    ctx.actions.run_shell(
        inputs = [files],
        outputs = [out_file],
        command = "yamllint '%s' | tee '%s'" %(files.path, out_file.path),
    )
#    output.append(outputs)
#    return DefaultInfo(files = depset(outputs))

yamllint = rule(
    implementation = _yamllint_impl,
    attrs = {
        "srcs": attr.label(mandatory = True, allow_single_file = True),
        "output": attr.output(doc = "Generated File."),
    },
)