# if running bash
if [ -n "$BASH_VERSION" ]
then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]
    then
	    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]
then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]
then
    PATH="$HOME/.local/bin:$PATH"
fi

# Personal scripts
if [ -d "$HOME/scripts" ]
then
    PATH="$HOME/scripts:$PATH"
fi

# Java home
if [ -d "$HOME/.local/java" ]
then
    # Use latest installed JDK for path
    jdk_dirname=$(ls -t "$HOME/.local/java" | head --lines=1)

    # Only add to PATH if a JDK is installed
    if [ ! -z "$jdk_dirname" ]
    then
        export JAVA_HOME="$HOME/.local/java/$jdk_dirname"
        PATH="$JAVA_HOME/bin:$PATH"
    fi

    # Clean up
    unset jdk_dirname
fi

# CUDA
cuda_dir="/usr/local/cuda"
if [ -d "$cuda_dir" ] || [ -L "$cuda_dir" ]
then
    export PATH="$cuda_dir/bin:$PATH"
fi

# Go
if [ -d "$HOME/.local/go" ]
then
    PATH="$HOME/.local/go/bin:$PATH"    
fi

