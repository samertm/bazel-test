
def _samer_binary_impl(ctx):
    toolchain = ctx.toolchains["//py:samer_toolchain"]
    ctx.actions.write(
        ctx.outputs.executable,
        "echo Hi there: {}".format(toolchain.samer),
        is_executable = True)
    return [DefaultInfo(files = depset([ctx.outputs.executable]))]

def _samer_bootstrap_binary_impl(ctx):
    toolchain = ctx.toolchains["//py:samer_bootstrap_toolchain"]
    ctx.actions.write(
        ctx.outputs.executable,
        "echo Hi there: {}".format(toolchain.samer),
        is_executable = True)
    return [DefaultInfo(files = depset([ctx.outputs.executable]))]


samer_binary = rule(
    _samer_binary_impl,
    toolchains = ["//py:samer_toolchain"],
    executable = True,
)

samer_bootstrap_binary = rule(
    _samer_bootstrap_binary_impl,
    toolchains = ["//py:samer_bootstrap_toolchain"],
    executable = True,
)


def _some_toolchain_impl(ctx):
    samer = ctx.toolchains["//py:samer_bootstrap_toolchain"].samer
    return [
        platform_common.ToolchainInfo(
            samer = samer,
            samerbin = ctx.attr.samerbin,
        ),
    ]

samer_toolchain_impl = rule(
    _some_toolchain_impl,
    attrs = {
        "samerbin": attr.string(mandatory = True),
    },
    toolchains = ["//py:samer_bootstrap_toolchain"],
)

def _samer_bootstrap_toolchain_impl(ctx):
    return [
        platform_common.ToolchainInfo(
            samer = ctx.attr.samer,
        ),
    ]

samer_bootstrap_toolchain_impl = rule(
    _samer_bootstrap_toolchain_impl,
    attrs = {
        "samer": attr.string(mandatory = True),
    },
)
