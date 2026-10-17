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
  castor = buildGleam {
    name = "castor";
    version = "2.1.0";
    otpApplication = "castor";

    src = fetchHex {
      pkg = "castor";
      version = "2.1.0";
      sha256 = "sha256-02WWgKv+gWNOJ0eUeUMe1m/EPyVH/bQfDprN55jNSxM=";
    };

    beamDeps = with self; [
      gleam_json
      gleam_stdlib
      non_empty_list
      oas_generator_utils
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

  midas = buildGleam {
    name = "midas";
    version = "3.1.0";
    otpApplication = "midas";

    src = fetchHex {
      pkg = "midas";
      version = "3.1.0";
      sha256 = "sha256-kYC2J4UrVB6vH8jUJYZzA0IKQq7UOu6JiR/0e3S7ZWk=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_json
      gleam_stdlib
    ];
  };

  non_empty_list = buildGleam {
    name = "non_empty_list";
    version = "2.3.0";
    otpApplication = "non_empty_list";

    src = fetchHex {
      pkg = "non_empty_list";
      version = "2.3.0";
      sha256 = "sha256-BvnTrHUc94U61dJLgTnOsw5C2Hmd6NSflmphl98LAcw=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  oas_generator_utils = buildGleam {
    name = "oas_generator_utils";
    version = "1.1.0";
    otpApplication = "oas_generator_utils";

    src = fetchHex {
      pkg = "oas_generator_utils";
      version = "1.1.0";
      sha256 = "sha256-VP6L1jitFJupQ63QqKZuVJsiiDKKs+v3ZNUoBaBB6pY=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_javascript
      gleam_json
      gleam_stdlib
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
