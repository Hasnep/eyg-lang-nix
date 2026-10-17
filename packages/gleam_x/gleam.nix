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
  gleam_fetch = buildGleam {
    name = "gleam_fetch";
    version = "1.4.1";
    otpApplication = "gleam_fetch";

    src = fetchHex {
      pkg = "gleam_fetch";
      version = "1.4.1";
      sha256 = "sha256-2EzvimDsafQLxbcZHiTpZ015hSAGpD5I8MNXRGkPEqI=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_javascript
      gleam_stdlib
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
