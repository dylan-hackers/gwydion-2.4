module: time-internal
author: dwatson@cmu.edu
synopsis: The Time library supporting c functions (generated by Melange).
copyright: See below.
rcs-header: $Header: /scm/cvs/src/common/time/Attic/time-intr.dylan,v 1.3 2000/01/24 04:55:43 andreas Exp $

//======================================================================
//
// Copyright (c) 1996  Carnegie Mellon University
// Copyright (c) 1998, 1999, 2000  Gwydion Dylan Maintainers
// All rights reserved.
// 
// Use and copying of this software and preparation of derivative
// works based on this software are permitted, including commercial
// use, provided that the following conditions are observed:
// 
// 1. This copyright notice must be retained in full on any copies
//    and on appropriate parts of any derivative works.
// 2. Documentation (paper or online) accompanying any system that
//    incorporates this software, or any part of it, must acknowledge
//    the contribution of the Gwydion Project at Carnegie Mellon
//    University, and the Gwydion Dylan Maintainers.
// 
// This software is made available "as is".  Neither the authors nor
// Carnegie Mellon University make any warranty about the software,
// its performance, or its conformity to any specification.
// 
// Bug reports should be sent to <gd-bugs@gwydiondylan.org>; questions,
// comments and suggestions are welcome at <gd-hackers@gwydiondylan.org>.
// Also, see http://www.gwydiondylan.org/ for updates and documentation. 
//
//======================================================================


#if (mindy)
define constant <size-t> = <integer>;

define  class <tm> (<statically-typed-pointer>) end;

define sealed method tm-sec
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 0);
end method tm-sec;

define sealed method tm-sec-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 0) := value;
  value;
end method tm-sec-setter;

define sealed method tm-min
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 4);
end method tm-min;

define sealed method tm-min-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 4) := value;
  value;
end method tm-min-setter;

define sealed method tm-hour
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 8);
end method tm-hour;

define sealed method tm-hour-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 8) := value;
  value;
end method tm-hour-setter;

define sealed method tm-mday
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 12);
end method tm-mday;

define sealed method tm-mday-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 12) := value;
  value;
end method tm-mday-setter;

define sealed method tm-mon
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 16);
end method tm-mon;

define sealed method tm-mon-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 16) := value;
  value;
end method tm-mon-setter;

define sealed method tm-year
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 20);
end method tm-year;

define sealed method tm-year-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 20) := value;
  value;
end method tm-year-setter;

define sealed method tm-wday
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 24);
end method tm-wday;

define sealed method tm-wday-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 24) := value;
  value;
end method tm-wday-setter;

define sealed method tm-yday
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 28);
end method tm-yday;

define sealed method tm-yday-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 28) := value;
  value;
end method tm-yday-setter;

define sealed method tm-isdst
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 32);
end method tm-isdst;

define sealed method tm-isdst-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 32) := value;
  value;
end method tm-isdst-setter;

define method pointer-value (value :: <tm>, #key index = 0) => (result :: <tm>);
  value + index * 36;
end method pointer-value;

define method content-size (value :: limited(<class>, subclass-of: <tm>)) => (result :: <integer>);
  36;
end method content-size;

define constant anonymous-29
  = constrain-c-function(find-c-function("strftime"), #(), #t, list(<size-t>));
define method strftime
    (arg1 :: <c-string>, arg2 :: <size-t>, arg3 :: <byte-string>, arg4 :: <decoded-time>)
 => (result :: <size-t>);
  let result-value
    = anonymous-29(export-value(<c-string>, arg1), arg2, export-value(<c-string>, arg3), export-value(<tm>, arg4));
  values(result-value);
end method strftime;

define constant anonymous-30 = find-c-pointer("daylight");
define sealed method daylight () => (result :: <integer>);
  signed-long-at(anonymous-30, offset: 0);
end method daylight;

define sealed method daylight-setter (value :: <integer>) => (result :: <integer>);
  signed-long-at(anonymous-30, offset: 0) := value;
  value;
end method daylight-setter;

define constant anonymous-31 = find-c-pointer("timezone");
define sealed method c-timezone () => (result :: <integer>);
  signed-long-at(anonymous-31, offset: 0);
end method c-timezone;

define sealed method c-timezone-setter (value :: <integer>) => (result :: <integer>);
  signed-long-at(anonymous-31, offset: 0) := value;
  value;
end method c-timezone-setter;

#else
c-include("time.h");

define constant <size-t> = <integer>;

define functional class <tm> (<statically-typed-pointer>) end;

define sealed domain make (singleton(<tm>));

define sealed method tm-sec
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 0);
end method tm-sec;

define sealed method tm-sec-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 0) := value;
  value;
end method tm-sec-setter;

define sealed method tm-min
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 4);
end method tm-min;

define sealed method tm-min-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 4) := value;
  value;
end method tm-min-setter;

define sealed method tm-hour
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 8);
end method tm-hour;

define sealed method tm-hour-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 8) := value;
  value;
end method tm-hour-setter;

define sealed method tm-mday
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 12);
end method tm-mday;

define sealed method tm-mday-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 12) := value;
  value;
end method tm-mday-setter;

define sealed method tm-mon
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 16);
end method tm-mon;

define sealed method tm-mon-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 16) := value;
  value;
end method tm-mon-setter;

define sealed method tm-year
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 20);
end method tm-year;

define sealed method tm-year-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 20) := value;
  value;
end method tm-year-setter;

define sealed method tm-wday
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 24);
end method tm-wday;

define sealed method tm-wday-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 24) := value;
  value;
end method tm-wday-setter;

define sealed method tm-yday
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 28);
end method tm-yday;

define sealed method tm-yday-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 28) := value;
  value;
end method tm-yday-setter;

define sealed method tm-isdst
    (ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 32);
end method tm-isdst;

define sealed method tm-isdst-setter
    (value :: <integer>, ptr :: <tm>) => (result :: <integer>);
  signed-long-at(ptr, offset: 32) := value;
  value;
end method tm-isdst-setter;

define method pointer-value (value :: <tm>, #key index = 0) => (result :: <tm>);
  value + index * 36;
end method pointer-value;

define method content-size (value :: subclass(<tm>)) => (result :: <integer>);
  36;
end method content-size;

define method strftime
    (arg1 :: <c-string>, arg2 :: <size-t>, arg3 :: <byte-string>, arg4 :: <decoded-time>)
 => (result :: <size-t>);
  let result-value
    = call-out("strftime", unsigned-int:, ptr: (export-value(<c-string>, arg1)).raw-value, unsigned-int: arg2, ptr: (export-value(<c-string>, arg3)).raw-value, ptr: (export-value(<tm>, arg4)).raw-value);
  values(result-value);
end method strftime;

define sealed method daylight () => (result :: <integer>);
  c-variable-ref(int: "&daylight");
end method daylight;

define sealed method daylight-setter (value :: <integer>) => (result :: <integer>);
  c-variable-ref(int: "&daylight") := value;
  value;
end method daylight-setter;

define sealed method c-timezone () => (result :: <integer>);
  c-variable-ref(long: "&timezone");
end method c-timezone;

define sealed method c-timezone-setter (value :: <integer>) => (result :: <integer>);
  c-variable-ref(long: "&timezone") := value;
  value;
end method c-timezone-setter;

#endif
define method import-value (cls == <decoded-time>, value :: <tm>)
 => (result :: <decoded-time>);
  let day-of-week = if (value.tm-wday = 0) 6 else value.tm-wday - 1 end if;

  make(<decoded-time>, seconds: value.tm-sec, minutes: value.tm-min,
       hours: value.tm-hour, day-of-week: day-of-week,
       day-of-month: value.tm-mday, month: value.tm-mon + 1,
       year: value.tm-year + 1900,
       daylight-savings-time?: value.tm-isdst > 0);
end method import-value;

define method export-value (cls == <tm>, value :: <decoded-time>)
 => (result :: <tm>);
  let tm = make(<tm>);

  tm.tm-sec := value.seconds;
  tm.tm-min := value.minutes;
  tm.tm-hour := value.hours;
  tm.tm-mday := value.day-of-month;
  tm.tm-mon := value.month - 1;
  tm.tm-year := value.year - 1900;
  tm.tm-wday := if (value.day-of-week = 6) 0 else value.day-of-week + 1 end if;
//  tm.tm-yday := days-before-month(value.month, value.year) + value.day-of-month;
  tm.tm-isdst := if (value.daylight-savings-time?) 1 else 0 end if;

  tm;
end method export-value;

define sealed inline method get-local-timezone ()
 => (timezone :: <integer>);
  c-timezone();
end method get-local-timezone;

define method local-daylight-savings-time? ()
 => (result :: <boolean>);
  (daylight() ~== 0);
end method local-daylight-savings-time?;
