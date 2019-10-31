



def _samer_binary_impl(ctx):
    toolchain = ctx.toolchains["//py:samer_toolchain"]
    ctx.actions.write(
        ctx.outputs.executable,
        "echo name: {}, bootstrap_ver: {}, toplevel_ver: {}".format(ctx.label.name, toolchain.bootstrap_ver, toolchain.toplevel_ver),
        is_executable = True)
    return [DefaultInfo(files = depset([ctx.outputs.executable]))]

def _samer_bootstrap_binary_impl(ctx):
    toolchain = ctx.toolchains["//py:samer_bootstrap_toolchain"]
    ctx.actions.write(
        ctx.outputs.executable,
        "echo name: {}, bootstrap_ver: {}".format(ctx.label.name, toolchain.bootstrap_ver),
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
    bootstrap_ver = ctx.toolchains["//py:samer_bootstrap_toolchain"].bootstrap_ver
    return [
        platform_common.ToolchainInfo(
            bootstrap_ver = bootstrap_ver,
            toplevel_ver = ctx.attr.toplevel_ver,
        ),
    ]

samer_toolchain_impl = rule(
    _some_toolchain_impl,
    attrs = {
        "toplevel_ver": attr.string(),
    },
    toolchains = ["//py:samer_bootstrap_toolchain"],
)

def _samer_bootstrap_toolchain_impl(ctx):
    return [
        platform_common.ToolchainInfo(
            bootstrap_ver = ctx.attr.bootstrap_ver,
        ),
    ]

samer_bootstrap_toolchain_impl = rule(
    _samer_bootstrap_toolchain_impl,
    attrs = {
        "bootstrap_ver": attr.string(mandatory = True),
    },
)

def _samer_standalone_binary_impl(ctx):
    toolchain = ctx.toolchains["//py:samer_standalone_toolchain"]
    bootstrap_bin_out = ctx.actions.declare_file("bootstrap_bin_out")
    ctx.actions.run_shell(
        tools = [ctx.executable.bootstrap_bin],
        outputs = [bootstrap_bin_out],
        command = "./%s > %s" % (ctx.executable.bootstrap_bin.path, bootstrap_bin_out.path)
    )
    ctx.actions.write(
        ctx.outputs.executable,
        """
echo
echo name: {}, standalone_ver: {}
echo printing bootstrap_bin_out:
cat $BUILD_WORKSPACE_DIRECTORY/{}
        """.format(ctx.label.name, toolchain.standalone_ver, bootstrap_bin_out.path),
        is_executable = True
    )
    return [
        DefaultInfo(files = depset([ctx.outputs.executable, bootstrap_bin_out])),
    ]

samer_standalone_binary = rule(
    _samer_standalone_binary_impl,
    attrs = {
        "bootstrap_bin": attr.label(executable = True, cfg = "host"),
    },
    toolchains = ["//py:samer_standalone_toolchain"],
    executable = True,
)

def _samer_standalone_toolchain_impl(ctx):
    return [
        platform_common.ToolchainInfo(
            standalone_ver = ctx.attr.standalone_ver,
        ),
    ]

samer_standalone_toolchain_impl = rule(
    _samer_standalone_toolchain_impl,
    attrs = {
        "standalone_ver": attr.string(mandatory = True),
    },
)


