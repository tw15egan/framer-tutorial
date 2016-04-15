$('.search__input').keyup(function() {
		
		
		query = $(this).val().trim();
	
		if (!SPECIAL_CHARS.has(query.charAt(0))) {
			if (query && query === $('.search__input').val().trim()) {
				$('.pending-container').addClass('hidden');
				$('.history-container').addClass('hidden');
				$('.search-container').removeClass('hidden');
				
				if (query.charAt(query.length-1) != "*") {
					encoded_query = query + "*";
				}
				encoded_query = encodeURIComponent(encoded_query);
				
				$.ajax(baseURL + '/searchUpdates?q='+encoded_query)
				.then( function(resp) {
					if ( $('.search__input').val().trim() === query ) {
						$('.search-container').html(resp);
					}
					else {
						resp = null;
​
					}
				});	
			}
			
			if (!query) {
				$('.search-container').empty();
				$('.search-container').addClass('hidden');
				
				if ($('.tabs__pending').hasClass('selected')) {
					$('.pending-container').removeClass('hidden');
					
					$.ajax(baseURL + '/pendingUpdates')
			    .then( function(resp) {
						$('.pending-container').html(resp);
					});
				}
				else if ($('.tabs__history').hasClass('selected')) {
					$('.history-container').removeClass('hidden');
						$.ajax(baseURL + '/updatesHistory')
				    .then( function(resp) {
							$('.history-container').html(resp);
						});
				}
				
			}
		}
		
​
	});