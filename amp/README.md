# AMP

AMP is a server manager with built-in support for many game types. Specifically, it is the best Minecraft server admin panel around (my opinion). It does require a paid license, but it's a one-time and low cost.

For a full description of AMP, see: https://cubecoders.com/AMP

To Install:

1. Open Unraid admin panel
2. Select the docker tab
3. Locate the Template Repositories list at the bottom of the page
4. Add this repo URL to the list (on a new line) : https://github.com/AngleRacket/unraid-containers/tree/master/amp
5. Then, on the same page, click the "new container" button and select "amp" from the list

Notes:
1. Make sure the port range for instances do not conflict with your other containers
2. Make sure the admin port does not conflictwith your other containers

Start the container, and open the web UI and you should be prompted for a license. Enter that, and you will be able to add instances.
