{include file="orderforms/$carttpl/_includes/header.tpl" step=1 title="Product Selection" pageinfo="Select a product below, use the dropdown to adjust the services offered"}


{foreach key=num item=product from=$products}
    <form method="post"
          action="{$smarty.server.PHP_SELF}?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}">

        <!-- TODO: MAKE BOOTSTRAP COLUMNS -->
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title">
                    {$product.name}

                    {if $product.qty!=""}
                        <em>({$product.qty} {$LANG.orderavailable})</em>
                    {/if}
                </h3>
            </div>

            <div class="panel-body">

                {$product.description}

                {if $product.freedomain}
                    <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomaindescription}</em>
                    <br/>
                {/if}

                {if $product.bid}
                    <strong>{$LANG.bundledeal}</strong>{if $product.displayprice} {$product.displayprice}{/if}
                {elseif $product.paytype eq "free"}

                    {$LANG.orderfree}
                    <br/>
                    <input type="hidden" name="billingcycle" value="free"/>
                {elseif $product.paytype eq "onetime"}

                    {if $product.pricing.hasconfigoptions}{$LANG.startingfrom} {/if}{$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                    <br/>
                    <input type="hidden" name="billingcycle" value="onetime"/>
                {elseif $product.paytype eq "recurring"}
                    <div class="form-group">
                        <label>Billing Cycle</label>
                        <select class="form-control" name="billingcycle">
                            {if $product.pricing.monthly}
                                <option value="monthly">{$product.pricing.monthly}</option>{/if}
                            {if $product.pricing.quarterly}
                                <option value="quarterly">{$product.pricing.quarterly}</option>{/if}
                            {if $product.pricing.semiannually}
                                <option value="semiannually">{$product.pricing.semiannually}</option>{/if}
                            {if $product.pricing.annually}
                                <option value="annually">{$product.pricing.annually}</option>{/if}
                            {if $product.pricing.biennially}
                                <option value="biennially">{$product.pricing.biennially}</option>{/if}
                            {if $product.pricing.triennially}
                                <option value="triennially">{$product.pricing.triennially}</option>{/if}
                        </select>
                    </div>
                {/if}

                <button class="btn btn-primary btn-block"
                        type="submit" {if $product.qty eq "0"} disabled{/if}>{$LANG.ordernowbutton}</button>

            </div>

        </div>

    </form>

{/foreach}

{include file="orderforms/$carttpl/_includes/footer.tpl"}