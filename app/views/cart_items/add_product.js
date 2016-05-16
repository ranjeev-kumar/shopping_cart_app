$('#cart-total').text(" <%= item_counts %> item(s) - Rs. <%= @total_amount %>");
$('#cart-list').html("<%= escape_javascript(render 'layouts/cart_product_list') %>");