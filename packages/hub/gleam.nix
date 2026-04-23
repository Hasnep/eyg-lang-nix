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

  backoff = buildRebar3 {
    name = "backoff";
    version = "1.1.6";
    otpApplication = "backoff";

    src = fetchHex {
      pkg = "backoff";
      version = "1.1.6";
      sha256 = "sha256-zwz/+JlfsgVi+CLlzEfYzPZkxezcJqaEy+hcIl+dfDk=";
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

  cigogne = buildGleam {
    name = "cigogne";
    version = "5.0.6";
    otpApplication = "cigogne";

    src = fetchHex {
      pkg = "cigogne";
      version = "5.0.6";
      sha256 = "sha256-EPUsvbOV8QJxlmJlH6JnatWI8Rkg2JFapzUGVc6v55U=";
    };

    beamDeps = with self; [
      argv
      envoy
      gleam_crypto
      gleam_erlang
      gleam_otp
      gleam_stdlib
      gleam_time
      pog
      simplifile
      splitter
      tom
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

  directories = buildGleam {
    name = "directories";
    version = "1.2.0";
    otpApplication = "directories";

    src = fetchHex {
      pkg = "directories";
      version = "1.2.0";
      sha256 = "sha256-0TCQz832dZuHIX6N3XOnWQOnABSKgsHTN5nzM+JJv54=";
    };

    beamDeps = with self; [
      envoy
      gleam_stdlib
      platform
      simplifile
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

  exception = buildGleam {
    name = "exception";
    version = "2.1.0";
    otpApplication = "exception";

    src = fetchHex {
      pkg = "exception";
      version = "2.1.0";
      sha256 = "sha256-Mp0mnVwqMU9zZL0nETcrbyxY+m85mBVy5cpoYk0pH4w=";
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

  filespy = buildGleam {
    name = "filespy";
    version = "0.7.0";
    otpApplication = "filespy";

    src = fetchHex {
      pkg = "filespy";
      version = "0.7.0";
      sha256 = "sha256-ETbH21Erg99UTNpGMqYzQSKBtISJQoOR2wNW9mQj18A=";
    };

    beamDeps = with self; [
      fs
      gleam_erlang
      gleam_otp
      gleam_stdlib
    ];
  };

  fs = buildRebar3 {
    name = "fs";
    version = "11.4.1";
    otpApplication = "fs";

    src = fetchHex {
      pkg = "fs";
      version = "11.4.1";
      sha256 = "sha256-3QCmHYnqwB0W0/xR1bDrXwci7448GjpUfNCGlX8yYKk=";
    };
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

  glisten = buildGleam {
    name = "glisten";
    version = "9.0.1";
    otpApplication = "glisten";

    src = fetchHex {
      pkg = "glisten";
      version = "9.0.1";
      sha256 = "sha256-d5WqUIMGVvOgMWprJllfiTyDJy2pAbNAXjEznKoxoQs=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_otp
      gleam_stdlib
      logging
    ];
  };

  gramps = buildGleam {
    name = "gramps";
    version = "6.0.1";
    otpApplication = "gramps";

    src = fetchHex {
      pkg = "gramps";
      version = "6.0.1";
      sha256 = "sha256-1VY2By3uFz9lhqVnnTwC7HoN4/hka3jDUbcpCP8iPfc=";
    };

    beamDeps = with self; [
      gleam_crypto
      gleam_erlang
      gleam_http
      gleam_stdlib
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

  hpack_erl = buildRebar3 {
    name = "hpack_erl";
    version = "0.3.0";
    otpApplication = "hpack";

    src = fetchHex {
      pkg = "hpack_erl";
      version = "0.3.0";
      sha256 = "sha256-1hN9cHkWnYxIXGli3+Jhr1ue9g+8VXNEURweZePZX7A=";
    };
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

  logging = buildGleam {
    name = "logging";
    version = "1.5.0";
    otpApplication = "logging";

    src = fetchHex {
      pkg = "logging";
      version = "1.5.0";
      sha256 = "sha256-vF8Yzl3ZaGEAIp/lQJvcPdXEbVp98vgErS2PDdbFBg4=";
    };

    beamDeps = with self; [
      gleam_stdlib
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

  mist = buildGleam {
    name = "mist";
    version = "6.0.3";
    otpApplication = "mist";

    src = fetchHex {
      pkg = "mist";
      version = "6.0.3";
      sha256 = "sha256-GwfzIdX6DLFi2BSW8t6WrrbviYD084IwpMw/hJSX4CA=";
    };

    beamDeps = with self; [
      exception
      gleam_erlang
      gleam_http
      gleam_otp
      gleam_stdlib
      glisten
      gramps
      hpack_erl
      logging
    ];
  };

  mist_reload = buildGleam {
    name = "mist_reload";
    version = "1.0.1";
    otpApplication = "mist_reload";

    src = fetchHex {
      pkg = "mist_reload";
      version = "1.0.1";
      sha256 = "sha256-nl4Aw0dszkvJR6OsUpp1jJMreu+67J8HP00AKa6Pixs=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_http
      gleam_otp
      gleam_stdlib
      mist
      radiate
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

  opentelemetry_api = buildRebar3 {
    name = "opentelemetry_api";
    version = "1.5.0";
    otpApplication = "opentelemetry_api";

    src = fetchHex {
      pkg = "opentelemetry_api";
      version = "1.5.0";
      sha256 = "sha256-9T7IoTN65KSH1DrInaS9OjyZ3fV2ZV0HHe7YtWotXdo=";
    };
  };

  pg_types = buildRebar3 {
    name = "pg_types";
    version = "0.6.0";
    otpApplication = "pg_types";

    src = fetchHex {
      pkg = "pg_types";
      version = "0.6.0";
      sha256 = "sha256-mUmkhJ3RNAj6JJq3t0Xg0t/blTKu4rlyIybjPNCCp3g=";
    };
  };

  pgo = buildRebar3 {
    name = "pgo";
    version = "0.20.0";
    otpApplication = "pgo";

    src = fetchHex {
      pkg = "pgo";
      version = "0.20.0";
      sha256 = "sha256-LxHmZJzrOOVp71axa+HQSHSuWxGgKGcICigXzkI8aDs=";
    };

    beamDeps = with self; [
      backoff
      opentelemetry_api
      pg_types
    ];
  };

  platform = buildGleam {
    name = "platform";
    version = "1.0.0";
    otpApplication = "platform";

    src = fetchHex {
      pkg = "platform";
      version = "1.0.0";
      sha256 = "sha256-gzlCCpWtiarA+C9MPbjdQBBBdC1sP0YTKoc59q63U5E=";
    };
  };

  pog = buildGleam {
    name = "pog";
    version = "4.1.0";
    otpApplication = "pog";

    src = fetchHex {
      pkg = "pog";
      version = "4.1.0";
      sha256 = "sha256-5K+6OaX6oudykYNsloOt6ILmWgarKMp9Ya56OtYeu9U=";
    };

    beamDeps = with self; [
      exception
      gleam_erlang
      gleam_otp
      gleam_stdlib
      gleam_time
      pgo
    ];
  };

  radiate = buildGleam {
    name = "radiate";
    version = "1.0.0";
    otpApplication = "radiate";

    src = fetchHex {
      pkg = "radiate";
      version = "1.0.0";
      sha256 = "sha256-q4aIjlbEY2QXcawhu3VGThm4SOczKJvW145WL2+nwSE=";
    };

    beamDeps = with self; [
      filespy
      gleam_erlang
      gleam_otp
      gleam_stdlib
      shellout
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

  tom = buildGleam {
    name = "tom";
    version = "2.0.2";
    otpApplication = "tom";

    src = fetchHex {
      pkg = "tom";
      version = "2.0.2";
      sha256 = "sha256-I0qELz0IfTVzdIP137bemDnjNm7wyvhybS0JQhAidnA=";
    };

    beamDeps = with self; [
      gleam_stdlib
      gleam_time
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

  wisp = buildGleam {
    name = "wisp";
    version = "2.2.2";
    otpApplication = "wisp";

    src = fetchHex {
      pkg = "wisp";
      version = "2.2.2";
      sha256 = "sha256-X/Xx4ojDQ3JSq7k9j5z0L/ZSznrVRIDP5zYDjcCcTyI=";
    };

    beamDeps = with self; [
      directories
      exception
      filepath
      gleam_crypto
      gleam_erlang
      gleam_http
      gleam_json
      gleam_stdlib
      houdini
      logging
      marceau
      mist
      simplifile
    ];
  };
})
