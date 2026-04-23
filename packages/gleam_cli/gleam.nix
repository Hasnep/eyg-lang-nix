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
  argv = buildGleam {
    name = "argv";
    version = "1.0.2";
    otpApplication = "argv";

    src = fetchHex {
      pkg = "argv";
      version = "1.0.2";
      sha256 = "sha256-uh/wkpUl3roc5nJW5a33enzd/nKePj9Xpb3KoDHe0J0=";
    };
  };

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

  bigi = buildGleam {
    name = "bigi";
    version = "4.1.1";
    otpApplication = "bigi";

    src = fetchHex {
      pkg = "bigi";
      version = "4.1.1";
      sha256 = "sha256-RP7fHfXB9CaoC2fDK5dtCCjWZSThG9wt0it403yIO6c=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
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

  envoy = buildGleam {
    name = "envoy";
    version = "1.2.0";
    otpApplication = "envoy";

    src = fetchHex {
      pkg = "envoy";
      version = "1.2.0";
      sha256 = "sha256-nG+7a/oCpSeYvuxZd6c4ytbkoFf0tn/QyAYa0lAsGRo=";
    };

    beamDeps = with self; [
      gleam_stdlib
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

  eyg_compiler = buildGleam {
    name = "eyg_compiler";
    version = "0.1.0";
    otpApplication = "eyg_compiler";

    src = ../gleam_compiler;

    beamDeps = with self; [
      eyg_analysis
      eyg_ir
      eyg_parser
      gleam_stdlib
    ];
  };

  eyg_hub = buildGleam {
    name = "eyg_hub";
    version = "0.1.0";
    otpApplication = "eyg_hub";

    src = ../gleam_hub;

    beamDeps = with self; [
      dag_json
      eyg_ir
      gleam_http
      gleam_json
      gleam_stdlib
      multiformats
      ogre
      spotless
      untethered
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

  gleam_crypto = buildGleam {
    name = "gleam_crypto";
    version = "1.6.0";
    otpApplication = "gleam_crypto";

    src = fetchHex {
      pkg = "gleam_crypto";
      version = "1.6.0";
      sha256 = "sha256-Lenk71PPb+4EnU92VzH3F496Ea764A7uY791NrNUrT8=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_fetch = buildGleam {
    name = "gleam_fetch";
    version = "1.4.0";
    otpApplication = "gleam_fetch";

    src = fetchHex {
      pkg = "gleam_fetch";
      version = "1.4.0";
      sha256 = "sha256-KEzojjdDZplUX59l1BPh37bB6j/jgktuogGNDs8Ij/w=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_javascript
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

  gleam_time = buildGleam {
    name = "gleam_time";
    version = "1.8.0";
    otpApplication = "gleam_time";

    src = fetchHex {
      pkg = "gleam_time";
      version = "1.8.0";
      sha256 = "sha256-Uz2HI3dNYa1JmDJPXdHavc2/q6+56Hy10DxpVUSPyX0=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_x = buildGleam {
    name = "gleam_x";
    version = "0.0.0";
    otpApplication = "gleam_x";

    src = ../gleam_x;

    beamDeps = with self; [
      gleam_fetch
      gleam_javascript
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

  input = buildGleam {
    name = "input";
    version = "1.0.1";
    otpApplication = "input";

    src = fetchHex {
      pkg = "input";
      version = "1.0.1";
      sha256 = "sha256-/oTNrceKE2fkr9VhpSmCWo/siNFly99RH9MibKvN7m8=";
    };
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

  kryptos = buildGleam {
    name = "kryptos";
    version = "1.4.0";
    otpApplication = "kryptos";

    src = fetchHex {
      pkg = "kryptos";
      version = "1.4.0";
      sha256 = "sha256-c02rg3lipKRXiPjmNQ70pt8gofVHNHNs0f86A//OTJc=";
    };

    beamDeps = with self; [
      bigi
      gleam_stdlib
      gleam_time
    ];
  };

  midas = buildGleam {
    name = "midas";
    version = "2.0.0";
    otpApplication = "midas";

    src = fetchHex {
      pkg = "midas";
      version = "2.0.0";
      sha256 = "sha256-5R6h8p+Rt5PHDIG1wpwro0PrfV9xRiVC3/ZDf5+axLM=";
    };

    beamDeps = with self; [
      filepath
      gleam_http
      gleam_json
      gleam_stdlib
      snag
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

  shellout = buildGleam {
    name = "shellout";
    version = "1.8.0";
    otpApplication = "shellout";

    src = fetchHex {
      pkg = "shellout";
      version = "1.8.0";
      sha256 = "sha256-xBY1bUUVHymBCMnbnNHt4DE/Ygte27V2bNcjdlnYeEE=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  simplifile = buildGleam {
    name = "simplifile";
    version = "2.4.0";
    otpApplication = "simplifile";

    src = fetchHex {
      pkg = "simplifile";
      version = "2.4.0";
      sha256 = "sha256-fBivpP7QtM4fpbC0usH6F0RCcFTqmTVl9vP4LlRTFw0=";
    };

    beamDeps = with self; [
      filepath
      gleam_stdlib
    ];
  };

  snag = buildGleam {
    name = "snag";
    version = "1.2.0";
    otpApplication = "snag";

    src = fetchHex {
      pkg = "snag";
      version = "1.2.0";
      sha256 = "sha256-J09B1sPs+Z92hv3OVBgzM+QdLBylo6Zz+aiyx6RAEHc=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  spotless = buildGleam {
    name = "spotless";
    version = "3.4.0";
    otpApplication = "spotless";

    src = fetchHex {
      pkg = "spotless";
      version = "3.4.0";
      sha256 = "sha256-JBVlbYdP0D7W/3AHsX9BoxQnfHXoAnfmvht8UDPZFEQ=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_json
      gleam_stdlib
      midas
      ogre
      snag
    ];
  };

  touch_grass = buildGleam {
    name = "touch_grass";
    version = "0.2.1";
    otpApplication = "touch_grass";

    src = fetchHex {
      pkg = "touch_grass";
      version = "0.2.1";
      sha256 = "sha256-iTX5jYkuW+hzjRvi7anp0q/WXZW4T5KwWB3+atc7vyg=";
    };

    beamDeps = with self; [
      eyg_interpreter
      gleam_http
      gleam_stdlib
      julienne
      ogre
    ];
  };

  untethered = buildGleam {
    name = "untethered";
    version = "0.0.0";
    otpApplication = "untethered";

    src = ../untethered;

    beamDeps = with self; [
      dag_json
      gleam_http
      gleam_json
      gleam_stdlib
      multiformats
      ogre
      spotless
    ];
  };
})
