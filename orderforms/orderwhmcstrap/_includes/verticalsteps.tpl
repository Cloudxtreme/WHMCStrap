<div class="row verticle-steps">
	
	<div class="col-md-3">
        <a class="step btn-block btn btn-default {if $step eq 1}active{/if}" href="cart.php">
			<strong>{$LANG.step|sprintf2:'1'}</strong><br /><small>{$LANG.cartchooseproduct}</small>
		</a>
	</div>
	
	<div class="col-md-3">
        <a class="step btn-block btn btn-default {if $step eq 2}active{/if}">
			<strong>{$LANG.step|sprintf2:'2'}</strong><br /><small>{$LANG.orderdomainoptions}</small>
		</a>
	</div>
	
	<div class="col-md-3">
        <a class="step btn-block btn btn-default {if $step eq 3}active{/if}">
			<strong>{$LANG.step|sprintf2:'3'}</strong><br /><small>{$LANG.orderconfigure}</small>
		</a>
	</div>
	
	<div class="col-md-3">
        <a class="step btn-block btn btn-default {if $step eq 4}active{/if}" href="cart.php?a=view">
			<strong>{$LANG.step|sprintf2:'4'}</strong><br /><small>{$LANG.ordercheckout}</small>
		</a>
	</div>
	
</div>

<hr>