{
  lib,
  newScope,
  beamPackages,
  buildGleam,
  fetchgit,
}:

let
  inherit (beamPackages) buildMix buildRebar3 fetchHex;
in

lib.makeScope newScope (self: {
  base32 = buildRebar3 {
    name = "base32";
    version = "1.0.0";
    otpApplication = "base32";

    src = fetchHex {
      pkg = "base32";
      version = "1.0.0";
      sha256 = "sha256-BEkoU0jtDEzYPHGY52xf1aBFHE7xhpW5/UN5KlA+VRo=";
    };
  };

  dag_json = buildGleam {
    name = "dag_json";
    version = "3.0.0";
    otpApplication = "dag_json";

    src = fetchHex {
      pkg = "dag_json";
      version = "3.0.0";
      sha256 = "sha256-Y9tAdcKQkteiL7NqAXdOVqbhpieIx/2ocxFVRq4QZOI=";
    };

    beamDeps = with self; [
      gleam_json
      gleam_stdlib
      multiformats
    ];
  };

  gleam_http = buildGleam {
    name = "gleam_http";
    version = "4.5.0";
    otpApplication = "gleam_http";

    src = fetchHex {
      pkg = "gleam_http";
      version = "4.5.0";
      sha256 = "sha256-ONflaYdZ1E8hQ282Uln3AVEE9vr6Ixgc0LK7Dltnvis=";
    };

    beamDeps = with self; [
      gleam_stdlib
      splitter
    ];
  };

  gleam_javascript = buildGleam {
    name = "gleam_javascript";
    version = "1.0.1";
    otpApplication = "gleam_javascript";

    src = fetchHex {
      pkg = "gleam_javascript";
      version = "1.0.1";
      sha256 = "sha256-1ULEtPQOlC9dM3LVJEGfpSGnu5LWIa9pbMKG6J2ILVU=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_json = buildGleam {
    name = "gleam_json";
    version = "3.1.0";
    otpApplication = "gleam_json";

    src = fetchHex {
      pkg = "gleam_json";
      version = "3.1.0";
      sha256 = "sha256-RP2qiEe+j8SMp6HAiXBr1UutzExFsjepku3fnyzbKDY=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_stdlib = buildGleam {
    name = "gleam_stdlib";
    version = "1.0.5";
    otpApplication = "gleam_stdlib";

    src = fetchHex {
      pkg = "gleam_stdlib";
      version = "1.0.5";
      sha256 = "sha256-zuW2wHaoW0X2DFhfQxbGPsi3EnwRnVc4w5WKnE1QQE4=";
    };
  };

  gleb128 = buildGleam {
    name = "gleb128";
    version = "4.0.0";
    otpApplication = "gleb128";

    src = fetchHex {
      pkg = "gleb128";
      version = "4.0.0";
      sha256 = "sha256-FSu/neur6ujUt0PTH3YRpq4KH3kkuL/OnOznc8UoC3c=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleeunit = buildGleam {
    name = "gleeunit";
    version = "1.11.0";
    otpApplication = "gleeunit";

    src = fetchHex {
      pkg = "gleeunit";
      version = "1.11.0";
      sha256 = "sha256-7DGrp0JWrqUx7fgWmTHXdbuzhP7QqKG9xN2TVOPiGCY=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  multiformats = buildGleam {
    name = "multiformats";
    version = "4.0.0";
    otpApplication = "multiformats";

    src = fetchHex {
      pkg = "multiformats";
      version = "4.0.0";
      sha256 = "sha256-SNKQlWpvIQhu6cDCtprK9dwAZ+5+RgWZBEXlvchbeq4=";
    };

    beamDeps = with self; [
      base32
      gleam_javascript
      gleam_stdlib
      gleb128
    ];
  };

  ogre = buildGleam {
    name = "ogre";
    version = "1.3.0";
    otpApplication = "ogre";

    src = fetchHex {
      pkg = "ogre";
      version = "1.3.0";
      sha256 = "sha256-xLb+Yj6a/Ca+Cy1atZ6Qfs0bWAEgOeS0u2fVoosl45I=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_stdlib
    ];
  };

  splitter = buildGleam {
    name = "splitter";
    version = "1.3.0";
    otpApplication = "splitter";

    src = fetchHex {
      pkg = "splitter";
      version = "1.3.0";
      sha256 = "sha256-jxSFMG4NWRaKOeEu2IRPn2FuxZw8Y6/P2uBNvWhpDLw=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };
})
