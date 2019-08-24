Learning and Using the K Framework
==================================

K is a framework for building and analyzing languages. As well as
providing support for defining the _syntax_ and producing parsers for
the syntax, as many other ["parser generator"][parsergen] tools such
as [Lex]/[Yacc] and [ANTLR] do, it also provides support for defining
the _semantics_ of the language directly, rather than writing custom
code to do this from the parser generator ouptut. Using a
domain-specific language designed for this rather than ad-hoc code in
a "regular" programming language allows you to ensure that the
language semantics are consistent and work as desired.

Versions
--------

There are currently no official versioned releases of K; the head of
the `master` branch in the [GitHub repo][repo] is as stable and
well-supported as any other version and so we recommend you build and
use that.

The version identifier for the head of `master` is currently "RV-K
version 1.0-SNAPSHOT." This is a merge of two previous forks of the "K
framework 4.x" versions which both were derived from "K framework
3.4"; these 3.x and 4.x versions are now obsolete.

The [online version of K][online] is still a version 4.0 system and
has some differences from the current versions.

XXX Sort out the "KVM" stuff from the [K tool binaries][kw-binaries]
page.

Windows native, Cygwin and MINGW builds are not supported; if you need
to run on Windows you should use the [Windows Subsystem for Linux]
with Ubuntu.


The Frontend and Backends
-------------------------

The frontend is written in Java and Scala. As well as that, at least
one of the following four backends is required to use the system:

- Java.
- LLVM: At least version 8. (Linux systems through Debian 9 provide
  only LLVM 7.)
- OCaml.
- Haskell.
- Rust???


Building
--------

XXX packages to install, particularly JVM version?

The Java and OCaml backends are included in the [main repo][repo], but
the LLVM and Haskell backends have their own repos. However, currently
the main repo can't be build without the code for these backends, even
if you're not building them, so you must do one of the following when
cloning:

    git clone https://github.com/kframework/k.git
    git submodule update --init --recursive

    git clone --recursive https://github.com/kframework/k.git

The simplest and quickest build uses only the Java backend:

    mvn package -DskipTests \
        -Dhaskell.backend.skip -Dllvm.backend.skip -Docaml.backend.skip

The resulting built version will be placed under your checkout in
`k-distribution/target/release/k`; the `bin/` subdirectory of this
contains scripts (for `kcompile`, `kast`, `krun`, etc.).

Running
-------

The `kompile` tool currently defaults to the OCaml backend, regardless
of whether or not it's installed or runnable. So when not using that
you must explicitly specify the backend to use:

    kompile --backend java foo.k

The build output is placed in `foo-kompiled` in the same directory as
the source file. Other tools will automatically detect the presence of
this and use it; if there are multiple compiled definitions (i.e.,
more than one `*-kompiled` you must manually select the right one
using the `-d`/`--directory` option.


TODO
----

    import INT              /* Previously predefined */
    ...
    syntax KResult          /* Previously predefined */



<!-------------------------------------------------------------------->
[kw-binaries]: http://www.kframework.org/index.php/K_tool_binaries
[online]: http://www.kframework.org/tool/run/
[repo]: https://github.com/kframework/k

[wsl]: https://docs.microsoft.com/en-us/windows/wsl/install-win10

[ANTLR]: https://en.wikipedia.org/wiki/ANTLR
[Lex]: https://en.wikipedia.org/wiki/Lex_(software)
[Yacc]: https://en.wikipedia.org/wiki/Yacc
[parsergen]: https://en.wikipedia.org/wiki/Compiler-compiler
