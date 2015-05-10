DNX_BIN=`find .dnx/runtimes -type d -name bin`
export PATH="$PATH:/app/mono/bin:$DNX_BIN"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/app/mono/lib:/app/libuv/lib"
export MONO_OPTIONS=--server
