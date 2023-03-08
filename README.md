# Lightbox

Lightbox is a game engine I'm building in C. I chose to use C because I thought
it would be a fun challenge. I don't intend for this engine to be used by others
or be ready in any sort of near future. 

## Projects

This repository contains two projects: LBX and sandbox. LBX contains all of the source
code for the lightbox engine itself. Sandbox is a test bed to test different functionality.
This is NOT a unit test project. In the future there will be a separate unit testing project.

## Compiling

This project is setup using Make and clang. Simply run `make` to build both the lightbox library
and the sandbox executable. `make lbx` will make just the library and `make sandbox` will
make just the sandbox. You can also use `make run` to automatically build both and execute
the sandbox.

## Rendering

Lightbox will use Vulkan even for mac. But in the future it might expand to more
options.


## Supported platforms

I use MacOS and do not have access to a Windows or Linux machine (yet). I do plan
for this engine to work on MacOS, Windows, and Linux but will only start working
on Windows and Linux support when I have a machine that run those OSs (probably
will only start in September-November 2023). Here is a table of supported functionality
across OSs.

| Feature      | MacOS | Windows | Linux |
| ------------ | ----- | ------- | ----- |
| Compiliation | ✅    | ❌      | ❌    |

