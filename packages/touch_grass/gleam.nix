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

  eyg_analysis = buildGleam {
    name = "eyg_analysis";
    version = "1.1.0";
    otpApplication = "eyg_analysis";

    src = ../gleam_analysis;

    beamDeps = with self; [
      eyg_ir
      eyg_parser
      gleam_stdlib
      multiformats
    ];
  };

  eyg_interpreter = buildGleam {
    name = "eyg_interpreter";
    version = "1.2.1";
    otpApplication = "eyg_interpreter";

    src = ../gleam_interpreter;

    beamDeps = with self; [
      eyg_ir
      gleam_javascript
      gleam_json
      gleam_stdlib
      multiformats
    ];
  };

  eyg_ir = buildGleam {
    name = "eyg_ir";
    version = "1.0.0";
    otpApplication = "eyg_ir";

    src = ../gleam_ir;

    beamDeps = with self; [
      dag_json
      gleam_javascript
      gleam_json
      gleam_stdlib
      multiformats
    ];
  };

  eyg_parser = buildGleam {
    name = "eyg_parser";
    version = "0.3.1";
    otpApplication = "eyg_parser";

    src = ../gleam_parser;

    beamDeps = with self; [
      eyg_ir
      gleam_stdlib
      multiformats
    ];
  };

  gleam_http = buildGleam {
    name = "gleam_http";
    version = "4.3.0";
    otpApplication = "gleam_http";

    src = fetchHex {
      pkg = "gleam_http";
      version = "4.3.0";
      sha256 = "sha256-gupqcXyEJFYYjBkK+zcmZepWzhPYVZvzsd2eQPYZ7gw=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_javascript = buildGleam {
    name = "gleam_javascript";
    version = "1.0.0";
    otpApplication = "gleam_javascript";

    src = fetchHex {
      pkg = "gleam_javascript";
      version = "1.0.0";
      sha256 = "sha256-72x3pQbwJsb7N5QYiUd81eQjT81DN/8Ok4Til8uPl+s=";
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
    version = "1.0.0";
    otpApplication = "gleam_stdlib";

    src = fetchHex {
      pkg = "gleam_stdlib";
      version = "1.0.0";
      sha256 = "sha256-lgCQwvs5F4S7NCZ7CZ3JMVzBsfYBPnQVvHY87xkF19M=";
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
    version = "1.10.0";
    otpApplication = "gleeunit";

    src = fetchHex {
      pkg = "gleeunit";
      version = "1.10.0";
      sha256 = "sha256-JUtpf+cu6te/gulBcjkY5CExeBOsSZI+52oYx4jGHnI=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  julienne = buildGleam {
    name = "julienne";
    version = "1.1.0";
    otpApplication = "julienne";

    src = fetchHex {
      pkg = "julienne";
      version = "1.1.0";
      sha256 = "sha256-tTilA7mWffAgEeWn+UIqAmPZqRwN57BGSD3o++fNRys=";
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
    version = "1.1.0";
    otpApplication = "ogre";

    src = fetchHex {
      pkg = "ogre";
      version = "1.1.0";
      sha256 = "sha256-afx4hltUnWx/YoG2kgbVia//ES9J5hBZR47Sa/LxBWo=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_stdlib
    ];
  };
})
