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

  conversation = buildGleam {
    name = "conversation";
    version = "2.0.2";
    otpApplication = "conversation";

    src = fetchHex {
      pkg = "conversation";
      version = "2.0.2";
      sha256 = "sha256-YK+0JKcj1bKZJUh7ymb/CesVf9Pvcq8HJxT+yQNwEiY=";
    };

    beamDeps = with self; [
      gleam_http
      gleam_javascript
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

  gleam_otp = buildGleam {
    name = "gleam_otp";
    version = "1.2.0";
    otpApplication = "gleam_otp";

    src = fetchHex {
      pkg = "gleam_otp";
      version = "1.2.0";
      sha256 = "sha256-umopTileQo7BVi3BwR6nUw3LmB6DWRNL6ryEk7eyJY4=";
    };

    beamDeps = with self; [
      gleam_erlang
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

  glen = buildGleam {
    name = "glen";
    version = "2.2.3";
    otpApplication = "glen";

    src = fetchHex {
      pkg = "glen";
      version = "2.2.3";
      sha256 = "sha256-o6OozyYUNExmDh8PmEN0y88v6X4yzdA5Nfzos5GQobA=";
    };

    beamDeps = with self; [
      conversation
      filepath
      gleam_community_ansi
      gleam_http
      gleam_javascript
      gleam_stdlib
      marceau
    ];
  };

  glen_node = buildGleam {
    name = "glen_node";
    version = "0.0.3";
    otpApplication = "glen_node";

    src = fetchHex {
      pkg = "glen_node";
      version = "0.0.3";
      sha256 = "sha256-CoEwLBa5cZ/Ef7AioSelHqZo1PeM5tzM9DCjwJg5VRE=";
    };

    beamDeps = with self; [
      gleam_javascript
      glen
    ];
  };

  gleroglero = buildGleam {
    name = "gleroglero";
    version = "1.2.0";
    otpApplication = "gleroglero";

    src = fetchHex {
      pkg = "gleroglero";
      version = "1.2.0";
      sha256 = "sha256-vdr4nZg98mpAQ92faFrxO8DJCmAOFlqn0N598noWBzk=";
    };

    beamDeps = with self; [
      gleam_stdlib
      lustre
    ];
  };

  houdini = buildGleam {
    name = "houdini";
    version = "1.2.1";
    otpApplication = "houdini";

    src = fetchHex {
      pkg = "houdini";
      version = "1.2.1";
      sha256 = "sha256-b4rC8Sl0Vn+3RL6mask863aq6hmtKFZGI/ds2pvCaoU=";
    };
  };

  javascript_mutable_reference = buildGleam {
    name = "javascript_mutable_reference";
    version = "1.0.0";
    otpApplication = "javascript_mutable_reference";

    src = fetchHex {
      pkg = "javascript_mutable_reference";
      version = "1.0.0";
      sha256 = "sha256-PulT7n/k+v0XwW8kGE9Mgy/iYNdhdT8o8g1KwdoIDwM=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  jot = buildGleam {
    name = "jot";
    version = "8.0.0";
    otpApplication = "jot";

    src = fetchHex {
      pkg = "jot";
      version = "8.0.0";
      sha256 = "sha256-zOEciQSxKcydo6KTtkWIS5HJbSUhg/bbyu+o8lh8rv0=";
    };

    beamDeps = with self; [
      gleam_stdlib
      houdini
      splitter
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

  lustre = buildGleam {
    name = "lustre";
    version = "5.6.0";
    otpApplication = "lustre";

    src = fetchHex {
      pkg = "lustre";
      version = "5.6.0";
      sha256 = "sha256-7lWM1NufCfzBZBet8Bg6PC2sPksh7TrAyuhZeSq4EMo=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_json
      gleam_otp
      gleam_stdlib
      houdini
    ];
  };

  marceau = buildGleam {
    name = "marceau";
    version = "1.3.0";
    otpApplication = "marceau";

    src = fetchHex {
      pkg = "marceau";
      version = "1.3.0";
      sha256 = "sha256-LRwnUEvvRQBfXfsYWR+GEPtL+pF0SHghC9xGRBLsROk=";
    };
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

  midas_browser = buildGleam {
    name = "midas_browser";
    version = "1.1.2";
    otpApplication = "midas_browser";

    src = fetchHex {
      pkg = "midas_browser";
      version = "1.1.2";
      sha256 = "sha256-VGumBMzg0eqyo5ZkR7f8unXxrnZ5BBNtBUZwXvNNMVo=";
    };

    beamDeps = with self; [
      gleam_fetch
      gleam_javascript
      gleam_stdlib
      midas
      plinth
      snag
    ];
  };

  midas_node = buildGleam {
    name = "midas_node";
    version = "1.4.0";
    otpApplication = "midas_node";

    src = fetchHex {
      pkg = "midas_node";
      version = "1.4.0";
      sha256 = "sha256-8Z1VKofwxxGba/hVqh/gjo3HBCSAsLBUxLb7nCLkemo=";
    };

    beamDeps = with self; [
      conversation
      filepath
      gleam_crypto
      gleam_fetch
      gleam_http
      gleam_javascript
      gleam_stdlib
      glen
      glen_node
      javascript_mutable_reference
      midas
      plinth
      shellout
      simplifile
      snag
    ];
  };

  morph = buildGleam {
    name = "morph";
    version = "1.0.0";
    otpApplication = "morph";

    src = ../morph;

    beamDeps = with self; [
      eyg_analysis
      eyg_interpreter
      eyg_ir
      gleam_stdlib
      gleam_x
      lustre
      multiformats
      plinth
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

  mysig = buildGleam {
    name = "mysig";
    version = "0.5.0";
    otpApplication = "mysig";

    src = fetchHex {
      pkg = "mysig";
      version = "0.5.0";
      sha256 = "sha256-jcX4oyzIGwfGGXqloXmrGCXYPxO8De+BlU07saHReCU=";
    };

    beamDeps = with self; [
      filepath
      gleam_http
      gleam_javascript
      gleam_json
      gleam_stdlib
      glen
      glen_node
      javascript_mutable_reference
      lustre
      marceau
      midas
      midas_node
      plinth
      simplifile
      snag
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

  plinth = buildGleam {
    name = "plinth";
    version = "0.10.2";
    otpApplication = "plinth";

    src = fetchHex {
      pkg = "plinth";
      version = "0.10.2";
      sha256 = "sha256-P+d87T8Z1wkY7jLOi/sSvhwoygBNmX+HTC2NrS23PYc=";
    };

    beamDeps = with self; [
      gleam_javascript
      gleam_json
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
    version = "0.2.2";
    otpApplication = "touch_grass";

    src = fetchHex {
      pkg = "touch_grass";
      version = "0.2.2";
      sha256 = "sha256-0n42GzjzC7F6JPEPO2p3k5qx2Li3l7EEEB7OrULwcfE=";
    };

    beamDeps = with self; [
      eyg_analysis
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
