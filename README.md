<!-- Based on https://github.com/othneildrew/Best-README-Template -->
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![BSD-3-Clause License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br>
<p align="center">
  <a href="https://github.com/logmanoriginal/libssh2-labview">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">libssh2-labview</h3>

  <p align="center">
    LabVIEW&trade; bindings for <a href="https://github.com/libssh2/libssh2">libssh2</a>.
    <br>
    <a href="https://github.com/logmanoriginal/libssh2-labview"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/logmanoriginal/libssh2-labview">View Demo</a>
    <br>
    <a href="https://github.com/logmanoriginal/libssh2-labview/issues">Report Bug</a>
    <br>
    <a href="https://github.com/logmanoriginal/libssh2-labview/issues">Request Feature</a>
  </p>
</p>

## About The Project

**libssh2-labview** provides LabVIEW&trade; bindings for [libssh2](https://github.com/libssh2/libssh2).

### Limitations

Although this project aims to provide complete bindings for libssh2, there are several limitations users need to be aware of:

- When calling `libssh2_channel_read()` and `libssh2_channel_read_ex()`, the buffer length is limited to 2^31-1 bytes (2 GiB) instead of 2^32-1 bytes (4 GiB). The reason for this is that arrays in LabVIEW are limited to 3^31-1 elements. The function must be called in a loop in order to read more data.
- When calling `libssh2_channel_write()` and `libssh2_channel_write_ex()`, the buffer length is limited to 2^31-1 bytes (2 GiB) instead of 2^32-1 bytes (4 GiB). The reason for this is that arrays in LabVIEW are limited to 2^31-1 elements. The function must be called in a loop in order to write more data.

### Built With

* [LabVIEW&trade;](https://www.ni.com/labview)

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* LabVIEW&trade; 2013 or later
* VI Package Manager

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/logmanoriginal/libssh2-labview.git
   ```

## Usage

Here is an example that uses libssh2-labview to execute a command on a remote SSH server.

![Example](images/example.png)

## Roadmap

See the [open issues](https://github.com/logmanoriginal/labview-composition/issues) for a list of proposed features (and known issues).

## Further Reading

- [RFC4251](https://www.rfc-editor.org/rfc/rfc4251): The Secure Shell (SSH) Protocol Architecture
- [RFC4252](https://www.rfc-editor.org/rfc/rfc4252): The Secure Shell (SSH) Authentication Protocol
- [RFC4253](https://www.rfc-editor.org/rfc/rfc4253): The Secure Shell (SSH) Transport Layer Protocol
- [RFC4254](https://www.rfc-editor.org/rfc/rfc4254): The Secure Shell (SSH) Connection Protocol

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Keep in mind that LabVIEW&trade; VIs are binary files, which are difficult to merge.
- Only change a single VI or library.
- Avoid conflicts with other pull requests (don't work on the same libraries or VIs).
- Send VI Snippets (via issues) instead of pull requests when possible.

## License

Distributed under the BSD-3-Clause License. See [`LICENSE`](LICENSE.txt) for more information.

This project uses third-party libraries or other resources that may be distributed under different licenses. See [`THIRD-PARTY-NOTICES`](THIRD-PARTY-NOTICES.txt) for more information.

## Contact

Project Link: [https://github.com/logmanoriginal/libssh2-labview](https://github.com/logmanoriginal/libssh2-labview)

## Acknowledgements

* [libssh2](https://github.com/libssh2/libssh2)
* [Caraya Unit Test Framework](https://github.com/JKISoftware/Caraya)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/logmanoriginal/libssh2-labview.svg?style=for-the-badge
[contributors-url]: https://github.com/logmanoriginal/libssh2-labview/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/logmanoriginal/libssh2-labview.svg?style=for-the-badge
[forks-url]: https://github.com/logmanoriginal/libssh2-labview/network/members
[stars-shield]: https://img.shields.io/github/stars/logmanoriginal/libssh2-labview.svg?style=for-the-badge
[stars-url]: https://github.com/logmanoriginal/libssh2-labview/stargazers
[issues-shield]: https://img.shields.io/github/issues/logmanoriginal/libssh2-labview.svg?style=for-the-badge
[issues-url]: https://github.com/logmanoriginal/libssh2-labview/issues
[license-shield]: https://img.shields.io/github/license/logmanoriginal/libssh2-labview.svg?style=for-the-badge
[license-url]: https://github.com/logmanoriginal/libssh2-labview/blob/master/LICENSE.txt
