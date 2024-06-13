# KPS-SHOPLIFT

KPS-Shoplift is a configurable script for FiveM servers that adds a shoplifting feature with support for different targeting systems (ox_target and qb-target). Players can attempt to steal items from specified locations, with configurable loot items, cooldowns, and the chance to alert the police.

## Features

- **Configurable Targeting System**: Supports *ox_target* and or *qb-target*.
- **Random Loot**: Players receive random items from a predefined list in the config file.
- **Robbery Timers**: Customizable durations for different stages of the shoplifting process.
- **Door Locking**: Temporarily locks store doors with a chance system.

### Locations

Define shoplifting locations with coordinates, rotations, and associated door names.

## Locales

Supports multiple languages, with premade English and Estonian locales available.

## Installation


1. Place the `kps-shoplift` folder in your FiveM server's resources directory.
2. Add `ensure kps-shoplift` to your `server.cfg` file.
3. Customize the `config.lua` file as needed.
4. Ensure your targeting system ('ox' or 'qb') is properly set up on your server.
5. Run the preconfigured `ox_doorlock` sql query
6. Restart the server

## Usage

Players can attempt to shoplift at configured locations, receiving random loot items defined in the config file and potentially alerting the police, with cooldowns and timers managed by the script.

## License

This project is licensed under the MIT License.