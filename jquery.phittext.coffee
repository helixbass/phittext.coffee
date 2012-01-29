(( $ ) ->
  $.fn
   .phitText =
    ( options ) ->
     $this = $ @
     $window = $ window
     settings = $.extend minFontSize:
                          Number
                           .NEGATIVE_INFINITY
                         maxFontSize:
                          Number
                           .POSITIVE_INFINITY
                         ratio:
                          0.1
                         container:
                          ""
                        ,
                         options

     (( f ) ->
       f()
       $window[ settings.resizeEvent ?
                 ( "smartresize" if $window.smartresize ) ?
                 "resize" ] f
     )( ->
         $this
          .css "font-size",
               Math.max( Math.min( settings
                                    .ratio *
                                    ( settings
                                       .container?() ?
                                       $this
                                        .parents settings
                                                  .container )
                                     .width(),
                                   parseFloat settings
                                               .maxFontSize ),
                         parseFloat settings
                                     .minFontSize ))
) jQuery
