module: dylan-user

define library common-dylan
  use dylan;
  use common-extensions,
    export: { finalization,
	      simple-debugging,
	      simple-io,
	      simple-random,
	      machine-word,
	      byte-vector };

  // Only import transcendentals if we have them.
#if (~compiled-for-solaris)
  use transcendental,
    export: { transcendental };
#endif

  export
    common-dylan;
end library;

define module common-dylan
  use dylan,
    export: all;
  use common-extensions,
    export: all;
end module;