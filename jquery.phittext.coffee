(( $ ) ->
  $.fn
   .phitText =
    ( options ) ->
     $window = $ window
     settings = $.extend minFontSize:
                          Number
                           .NEGATIVE_INFINITY
                         maxFontSize:
                          Number
                           .POSITIVE_INFINITY
                         container:
                          ""
                        ,
                         options

     @.each ->
        $this = $ @
        (( f ) ->
          f()
          $window[ settings.resizeEvent ?
                    ( "smartresize" if $window.smartresize ) ?
                    "resize" ] f
        )( $.proxy ->
                    $this = $ @
                    $this
                     .css "font-size",
                          Math.max( Math.min(( settings
                                                .ratio ?
                                                $this
                                                 .data( "phitText.ratio" ) ?
                                                (( ratio ) ->
                                                   $this
                                                    .data( "phitText.ratio",
                                                           ratio )
                                                   ratio ) parseFloat( $this
                                                                        .css "font-size" ) /
                                                            settings
                                                             .refWidth ) *
                                               ( settings
                                                  .container?() ?
                                                  $this
                                                   .parents settings
                                                             .container )
                                                .width(),
                                              parseFloat settings
                                                          .maxFontSize ),
                                    parseFloat settings
                                                .minFontSize )
                  ,
                   $this )
     @
) jQuery
