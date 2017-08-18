// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
console.log('counties.js')
$(document).ready(function () {
    'use strict';
    $('#country').on('change', function () {
        updateState($(this).val(), '#state')
    })

    function updateState(region, id_state_select) {
        var country = region
        var state_select = $(id_state_select);
        state_select.data('base-url', Spree.pathFor("admin/counties.js?country_id="+country+"&state_id="))
        $.get(Spree.routes.states_search + '?country_id=' + country, function (data) {
            var states = data.states
            if (states.length > 0) {
                state_select.html('')
            }
            var states_with_blank = states
            $.each(states_with_blank, function (pos, state) {
                    var opt = $(document.createElement('option')).prop('value', state.id).html(state.name);
                    state_select.append(opt)
            })
            state_select.prop('disabled', false).show()
            state_select.select2()
            state_select.trigger('change')
        })
    }
});