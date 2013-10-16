[![Build Status](https://secure.travis-ci.org/rolandwalker/nav-flash.png?branch=master)](http://travis-ci.org/rolandwalker/nav-flash)

Overview
========

Briefly highlight the current line in Emacs.

Quickstart
----------

```lisp
(require 'nav-flash)
 
(nav-flash-show)
```

Explanation
-----------

Nav-flash temporarily highlights the line containing the point,
which is sometimes useful for orientation after a navigation command.

There is no user-level interface for this library; it is only used
by other Lisp libraries.  However, you might find it useful to call
`nav-flash-show` in your ~/.emacs file.  For example, the following
hook causes a flash to appear after navigating via imenu:

```lisp
(add-hook 'imenu-after-jump-hook 'nav-flash-show nil t)
```

See Also
--------

	M-x customize-group RET nav-flash RET
	M-x customize-group RET pulse RET

Notes
-----

This library reuses an overlay defined in compile.el, but should
not affect the normal use of compile.el / next-error.

Pulse.el provides similar functionality and is included with
Emacs.  This library can use pulse.el, but does not do so by
default, because pulse.el uses `sit-for`, breaking this type
of construction:

```lisp
(nav-flash-show)
(with-temp-message "message here"
   (sit-for 2))
```

When using an overlay and timer for cleanup (as nav-flash does
by default) the flash and message appear simultaneously.

Nav-flash.el is also simpler than pulse.el.

Compatibility and Requirements
------------------------------

	GNU Emacs version 24.3-devel     : yes, at the time of writing
	GNU Emacs version 24.3           : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.3 and lower : no

No external dependencies
