$ ->
  $form = $('form')

  if $form
    #----------- Checkbox constructor-----------#
    $checkbox = $form.find('label.checkbox')
    $checkbox.each ->
      $this = $(this)
      $this.addClass 'checkbox-custom'
      $input_checkbox = $this.find('input[type="checkbox"]')
      $icon_checkbox = $("<i class=\"checkbox\"></i>").insertAfter( $input_checkbox )
      $input_checkbox
        .focusin(->
          $icon_checkbox.addClass 'focus'
        )
        .focusout(->
          $icon_checkbox.removeClass 'focus'
        )

    #----------- Radio constructor-----------#
    $radio = $form.find('label.radio')
    $radio.each ->
      $this = $(this)
      $this.addClass 'radio-custom'
      $input_radio = $this.find('input[type="radio"]')
      $icon_radio = $("<i class=\"radio\"></i>").insertAfter( $input_radio )
      $input_radio
        .focusin(->
          $icon_radio.addClass 'focus'
        )
        .focusout(->
          $icon_radio.removeClass 'focus'
        )

    #----------- Spinner constructor-----------#
    $spinner = $form.find('input[type="number"].spinner-input')
    $spinner.each ->
      $this = $(this)
      $spinner_wrapper = $this.wrap("<div class='spinner'/>")
      $("<div class='spinner-buttons btn-group btn-group-vertical'><button class='btn spinner-up' type='button'><i class='icon-chevron-up'></i></button><button class='btn spinner-down' type='button'><i class='icon-chevron-down'></i></button></div>").insertAfter( $this )

    #----------- File upload -----------#
    $('input[type="file"]').customFileInput()