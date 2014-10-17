
	</div>
	
	<!-- RIGHT SIDE -->
	<div class="col-md-4">

        {if $showcart}
		<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
			<input type="hidden" name="validatepromo" value="true" />
			{include file="orderforms/$carttpl/_includes/cart.tpl"}
		</form>
        {/if}

        <!-- TODO: RIGHT COLUMN -->
	</div>

</div>