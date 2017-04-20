# Terraria dedicated server

Starting and managing terraria dedicated server.  These scripts are designed to
run on Linux to make it easy for hosting a dedicated server.

# Download dedicated server

Visit [terraria.org][1], at the bottom of the site (the very bottom) you'll see
a small link titled `Dedicated Server`.  Download the dedicated server.

Alternatively, execute:

    ./download-dedicated-server.sh

# Setup server configuration


Copy the `serverconfig.txt` out of the Terraria directory.

    cp server/Linux/serverconfig.txt ./

Edit `serverconfig.txt` and point it to the world in Steam.

# Start the server

The end goal is to play terraria on the dedicated server.  A script has been
conveniently provided to start the dedicated server.

    ./terraria.sh

It will start Terraria in the foreground.  Type `help` to see commands available
inside of the dedicated server.  Type `exit` to exit the dedicated server.

# Pro tips

### Updating dedicated server

[`download-dedicated-server.sh`][2] is designed to always download the latest
dedicated server from [terraria.org][1].  To update, simply run the script
again.  It creates a backup of the old dedicated server in `server.old`
directory.

Update to latest:

    ./download-dedicated-server.sh

### Run inside of screen

Run the dedicated server inside of a [screen session][3].

### Reuse a world generated from Steam

Steam typically stores worlds in:

    "${HOME}"/.local/share/Steam/userdata/*/*/remote/worlds/*.wld

To find where your world lives execute the following find command:

    find "${HOME}/.local/share/Steam/userdata" -type f -name '*.wld'

I tend to also symlink the `remote` directory to saves.  e.g.

    ln -s $HOME/.local/share/Steam/userdata/.../remote ./saves

That makes it quickly accessible.

[1]: https://terraria.org/
[2]: download-dedicated-server.sh
[3]: https://help.ubuntu.com/community/Screen
