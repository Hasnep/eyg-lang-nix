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
    version = "2.0.1";
    otpApplication = "eyg_analysis";

    src = ../gleam_analysis;

    beamDeps = with self; [
      eyg_ir
      eyg_parser
      glam
      gleam_stdlib
      multiformats
    ];
  };

  eyg_interpreter = buildGleam {
    name = "eyg_interpreter";
    version = "7.0.0";
    otpApplication = "eyg_interpreter";

    src = ../gleam_interpreter;

    beamDeps = with self; [
      eyg_ir
      glam
      gleam_javascript
      gleam_json
      gleam_stdlib
      multiformats
    ];
  };

  eyg_ir = buildGleam {
    name = "eyg_ir";
    version = "3.2.0";
    otpApplication = "eyg_ir";

    src = ../gleam_ir;

    beamDeps = with self; [
      dag_json
      filepath
      gbor
      gleam_json
      gleam_stdlib
      gleb128
      midas
      multiformats
    ];
  };

  eyg_parser = buildGleam {
    name = "eyg_parser";
    version = "0.5.2";
    otpApplication = "eyg_parser";

    src = ../gleam_parser;

    beamDeps = with self; [
      eyg_ir
      gleam_stdlib
      multiformats
    ];
  };

  filepath = buildGleam {
    name = "filepath";
    version = "1.1.2";
    otpApplication = "filepath";

    src = fetchHex {
      pkg = "filepath";
      version = "1.1.2";
      sha256 = "sha256-sGqa8L8Q5RQB1kuY5LYn8dLkjBVJZ9p69NCRR4Cm1Ao=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gbor = buildGleam {
    name = "gbor";
    version = "1.0.0";
    otpApplication = "gbor";

    src = fetchHex {
      pkg = "gbor";
      version = "1.0.0";
      sha256 = "sha256-IpQF3hQ8HWaRlCdrHzOEcfbvqleWum0c9C8zsBNHuC8=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_stdlib
      ieee_float
    ];
  };

  glam = buildGleam {
    name = "glam";
    version = "2.0.4";
    otpApplication = "glam";

    src = fetchHex {
      pkg = "glam";
      version = "2.0.4";
      sha256 = "sha256-SKBDoSCR+T2RHDFt2Pf/0DzZ/29QhI/FbjWdPBaN8Po=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_erlang = buildGleam {
    name = "gleam_erlang";
    version = "1.3.0";
    otpApplication = "gleam_erlang";

    src = fetchHex {
      pkg = "gleam_erlang";
      version = "1.3.0";
      sha256 = "sha256-ESStOqIRQ+WvD8XPPZUp9tuMoD5DpVcRtgtrezh0N1w=";
    };

    beamDeps = with self; [
      gleam_stdlib
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

  gleam_time = buildGleam {
    name = "gleam_time";
    version = "1.10.0";
    otpApplication = "gleam_time";

    src = fetchHex {
      pkg = "gleam_time";
      version = "1.10.0";
      sha256 = "sha256-VlOSFuTEsXSHFGUqs48L0WuRAfYdtidp/cfNQqjl6DM=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
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

  ieee_float = buildGleam {
    name = "ieee_float";
    version = "1.6.0";
    otpApplication = "ieee_float";

    src = fetchHex {
      pkg = "ieee_float";
      version = "1.6.0";
      sha256 = "sha256-EvZfBoisHqOCbd+2dOZl0MblOoqj00aEgiLFXbMs+rE=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  julienne = buildGleam {
    name = "julienne";
    version = "1.1.1";
    otpApplication = "julienne";

    src = fetchHex {
      pkg = "julienne";
      version = "1.1.1";
      sha256 = "sha256-fvcJW7A8PAgHzRXiHGIENvTbD5ojp3ggakeCAqWfNvo=";
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
    version = "1.2.0";
    otpApplication = "ogre";

    src = fetchHex {
      pkg = "ogre";
      version = "1.2.0";
      sha256 = "sha256-onuu1RASzMDhip4TnfjrYAyuuhgUA+w/3FwO+oamD9w=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_stdlib
    ];
  };
})
