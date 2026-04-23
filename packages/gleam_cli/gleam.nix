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
    version = "1.1.0";
    otpApplication = "argv";

    src = fetchHex {
      pkg = "argv";
      version = "1.1.0";
      sha256 = "sha256-MnfRAESL20opttWMDzb2McvDSei90JdmxjCd8gKDEUA=";
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

  birdie = buildGleam {
    name = "birdie";
    version = "2.0.2";
    otpApplication = "birdie";

    src = fetchHex {
      pkg = "birdie";
      version = "2.0.2";
      sha256 = "sha256-feeYlPHZLDaymVZMX7438Q6/FsYAJW4R9gAR/auX1ys=";
    };

    beamDeps = with self; [
      argv
      edit_distance
      envoy
      filepath
      glance
      gleam_community_ansi
      gleam_json
      gleam_stdlib
      global_value
      justin
      rank
      simplifile
      term_size
      tom
      trie_again
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

  edit_distance = buildGleam {
    name = "edit_distance";
    version = "3.0.1";
    otpApplication = "edit_distance";

    src = fetchHex {
      pkg = "edit_distance";
      version = "3.0.1";
      sha256 = "sha256-3liLw0g+1tunFyEbWfMXiJGl/G8cANQVroxCM+r7lLE=";
    };

    beamDeps = with self; [
      gleam_stdlib
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
      eyg_analysis
      eyg_interpreter
      eyg_ir
      gleam_http
      gleam_json
      gleam_stdlib
      midas
      multiformats
      ogre
      untethered
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

  glance = buildGleam {
    name = "glance";
    version = "7.0.0";
    otpApplication = "glance";

    src = fetchHex {
      pkg = "glance";
      version = "7.0.0";
      sha256 = "sha256-6lKYaWVAjUMAOhdg5BRXST65YJjeGT5q2GRpMOwZDLk=";
    };

    beamDeps = with self; [
      gleam_stdlib
      glexer
    ];
  };

  gleam_community_ansi = buildGleam {
    name = "gleam_community_ansi";
    version = "1.5.0";
    otpApplication = "gleam_community_ansi";

    src = fetchHex {
      pkg = "gleam_community_ansi";
      version = "1.5.0";
      sha256 = "sha256-tapDOvhDE+I/35DM/3Urk4D+n/zgKylJ1Jt6rMx3sW0=";
    };

    beamDeps = with self; [
      gleam_community_colour
      gleam_regexp
      gleam_stdlib
    ];
  };

  gleam_community_colour = buildGleam {
    name = "gleam_community_colour";
    version = "2.0.4";
    otpApplication = "gleam_community_colour";

    src = fetchHex {
      pkg = "gleam_community_colour";
      version = "2.0.4";
      sha256 = "sha256-bbRmVVXX0rJ/DqMu9H6L68QwOCF2X5xz1IPzjuJIlPA=";
    };

    beamDeps = with self; [
      gleam_json
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

  gleam_regexp = buildGleam {
    name = "gleam_regexp";
    version = "1.1.1";
    otpApplication = "gleam_regexp";

    src = fetchHex {
      pkg = "gleam_regexp";
      version = "1.1.1";
      sha256 = "sha256-nCFcbKhKWzW7k0qbYamjBux0MVO+KwQloNAy5HewYqk=";
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

  glexer = buildGleam {
    name = "glexer";
    version = "2.5.0";
    otpApplication = "glexer";

    src = fetchHex {
      pkg = "glexer";
      version = "2.5.0";
      sha256 = "sha256-1CPPY7jU+WVO9T0K9JBLJJ6wZ5vUHGNEAXCsUIycxl4=";
    };

    beamDeps = with self; [
      gleam_stdlib
      splitter
    ];
  };

  global_value = buildGleam {
    name = "global_value";
    version = "1.0.0";
    otpApplication = "global_value";

    src = fetchHex {
      pkg = "global_value";
      version = "1.0.0";
      sha256 = "sha256-I/dMkae4GcQ6vMv0na1buHmdgfKjc2uppTS9R/MJ/08=";
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

  justin = buildGleam {
    name = "justin";
    version = "1.1.0";
    otpApplication = "justin";

    src = fetchHex {
      pkg = "justin";
      version = "1.1.0";
      sha256 = "sha256-ixxiJp6GB9Cg7WmLeQOYTOC/e2s8Deo8bIMCs5QCg3s=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  kryptos = buildGleam {
    name = "kryptos";
    version = "1.5.0";
    otpApplication = "kryptos";

    src = fetchHex {
      pkg = "kryptos";
      version = "1.5.0";
      sha256 = "sha256-BwehSS6Fhc7IIYMVxpoYK0PNJeIsIWy1MDMMlPXWKUQ=";
    };

    beamDeps = with self; [
      bigi
      gleam_stdlib
      gleam_time
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

  rank = buildGleam {
    name = "rank";
    version = "1.1.0";
    otpApplication = "rank";

    src = fetchHex {
      pkg = "rank";
      version = "1.1.0";
      sha256 = "sha256-uEbVTRUS+4OjmUoHqMeRX+dDNambzh7ceUPqMe1xDf0=";
    };

    beamDeps = with self; [
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
    version = "2.7.0";
    otpApplication = "simplifile";

    src = fetchHex {
      pkg = "simplifile";
      version = "2.7.0";
      sha256 = "sha256-onJ2J7Bj6HNRk0x/fwCPLR/bFvbeC4x5+eRkWc/JwWQ=";
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

  splitter = buildGleam {
    name = "splitter";
    version = "1.2.0";
    otpApplication = "splitter";

    src = fetchHex {
      pkg = "splitter";
      version = "1.2.0";
      sha256 = "sha256-Pf1rbEnmHtr297J6QgVKF8/2yiE1/1U9DLYcI00oHdA=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  spotless = buildGleam {
    name = "spotless";
    version = "7.0.0";
    otpApplication = "spotless";

    src = fetchHex {
      pkg = "spotless";
      version = "7.0.0";
      sha256 = "sha256-irLVom1jk/djQ3QwGa7g3cLTIQ9WUBUOi7qJnHH6Cfg=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_json
      gleam_stdlib
      midas
      non_empty_list
      ogre
      snag
    ];
  };

  term_size = buildGleam {
    name = "term_size";
    version = "1.0.1";
    otpApplication = "term_size";

    src = fetchHex {
      pkg = "term_size";
      version = "1.0.1";
      sha256 = "sha256-0AvSvI+z67fmrgdvPx/yrJ1e0YBfAE0IlseE0GxmRfE=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  tom = buildGleam {
    name = "tom";
    version = "2.1.0";
    otpApplication = "tom";

    src = fetchHex {
      pkg = "tom";
      version = "2.1.0";
      sha256 = "sha256-3PBMt6s11Yz8WYxm6i4YFtFgdZgCyJsrpiOHgNWbwlY=";
    };

    beamDeps = with self; [
      gleam_stdlib
      gleam_time
    ];
  };

  touch_grass = buildGleam {
    name = "touch_grass";
    version = "0.4.0";
    otpApplication = "touch_grass";

    src = ../touch_grass;

    beamDeps = with self; [
      eyg_analysis
      eyg_interpreter
      eyg_ir
      gleam_http
      gleam_stdlib
      gleam_time
      julienne
      multiformats
      ogre
    ];
  };

  trie_again = buildGleam {
    name = "trie_again";
    version = "1.1.4";
    otpApplication = "trie_again";

    src = fetchHex {
      pkg = "trie_again";
      version = "1.1.4";
      sha256 = "sha256-471mtOEm71Z+qMSUTqshZBM5Kt9sFsNgR6957l7xNGY=";
    };

    beamDeps = with self; [
      gleam_stdlib
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
    ];
  };
})
