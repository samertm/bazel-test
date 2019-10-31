load("//py:toolchain.bzl", "samer_toolchain_impl", "samer_bootstrap_binary", "samer_binary", "samer_bootstrap_toolchain_impl", "samer_standalone_toolchain_impl", "samer_standalone_binary")

samer_binary(
    name = "samer_compile"
)

samer_bootstrap_binary(
    name = "samer_bootstrap_bin",
)

samer_toolchain_impl(
    name = "samer-toolchain-impl",
    toplevel_ver = "x86_64",
)

toolchain(
    name = "samer-toolchain",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = ":samer-toolchain-impl",
    toolchain_type = "//py:samer_toolchain",
)


samer_bootstrap_toolchain_impl(
    name = "samer-bootstrap-toolchain-impl",
    bootstrap_ver = "x86_64",
)

toolchain(
    name = "samer-bootstrap-toolchain",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = ":samer-bootstrap-toolchain-impl",
    toolchain_type = "//py:samer_bootstrap_toolchain",
)


samer_bootstrap_toolchain_impl(
    name = "samer-bootstrap-toolchain-impl-x86",
    bootstrap_ver = "x86",
)

toolchain(
    name = "samer-bootstrap-toolchain-x86",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
        #"@bazel_tools//platforms:x86_32",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_32",
    ],
    toolchain = ":samer-bootstrap-toolchain-impl-x86",
    toolchain_type = "//py:samer_bootstrap_toolchain",
)

samer_toolchain_impl(
    name = "samer-toolchain-impl-x86",
    toplevel_ver = "x86",
)

toolchain(
    name = "samer-toolchain-x86",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
        #"@bazel_tools//platforms:x86_32",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_32",
    ],
    toolchain = ":samer-toolchain-impl-x86",
    toolchain_type = "//py:samer_toolchain",
)

samer_standalone_toolchain_impl(
    name = "samer-standalone-toolchain-impl-x86",
    standalone_ver = "x86",
)

toolchain(
    name = "samer-standalone-toolchain-x86",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
        #"@bazel_tools//platforms:x86_32",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_32",
    ],
    toolchain = ":samer-standalone-toolchain-impl-x86",
    toolchain_type = "//py:samer_standalone_toolchain",
)

samer_standalone_binary(
    name = "samer_standalone_bin",
    bootstrap_bin = ":samer_bootstrap_bin",
)
