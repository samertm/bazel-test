load("//py:toolchain.bzl", "samer_toolchain_impl", "samer_binary", "samer_bootstrap_toolchain_impl")

samer_binary(
    name = "samer_compile"
)

samer_toolchain_impl(
    name = "samer-toolchain-impl",
    samerbin = ":samer_compile",
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
    samer = "hellothere",
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
