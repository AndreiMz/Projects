# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  initialize_users_typeahead = ->
    users_typeahead = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace(
        "name", "beers", "beer_styles"
      ),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: "/autocomplete"
    )

    users_typeahead.clearPrefetchCache()
    
    users_typeahead.initialize()

    typeaheadFn = $(".js-user-autocomplete").typeahead(null,
      displayKey: "name"
      source: users_typeahead.ttAdapter()
      templates:
        suggestion: Handlebars.compile("
          <div>
            {{#if name}}
              Name: <strong>{{name}}</strong>
            {{/if}}
            {{#if beers}}
              Beers: <strong>{{beers}}</strong>
            {{/if}}
            {{#if beer_styles}}
              Beer Style: <strong>{{beer_styles}}</strong>
            {{/if}}
          </div>
        ")
        ).on 'typeahead:rendered', ->
        breweries = []
        i = 1
        i
        while i < arguments.length
          breweries.push arguments[i]['id']
          i++
        window.breweries = breweries;
        return

  initialize_users_typeahead()