<li class="${request.getAttribute("attributeClass")!}">
  <#-- variable setup and worker calls -->
  <#assign maxRecentlyViewedProducts = pdpRecentViewedMax/>
  <#if sessionAttributes.lastViewedProducts?exists && sessionAttributes.lastViewedProducts?has_content>
    <div class="js_pdpRecentlyViewed">
       <#assign plpFacetGroupVariantSwatch = Static["com.osafe.util.Util"].getProductStoreParm(request,"PLP_FACET_GROUP_VARIANT_SWATCH_IMG")!""/>
       <#assign plpFacetGroupVariantSticky =  Static["com.osafe.util.Util"].getProductStoreParm(request,"PLP_FACET_GROUP_VARIANT_PDP_MATCH")!""/>
       <#assign facetGroupMatch = Static["com.osafe.util.Util"].getProductStoreParm(request,"FACET_GROUP_VARIANT_MATCH")!""/>
       
       ${setRequestAttribute("PLP_FACET_GROUP_VARIANT_SWATCH",plpFacetGroupVariantSwatch)}
       <#if plpFacetGroupVariantSwatch?has_content>
          <#assign plpFacetGroupVariantSwatch=plpFacetGroupVariantSwatch.toUpperCase()/>
           ${setRequestAttribute("PLP_FACET_GROUP_VARIANT_SWATCH",plpFacetGroupVariantSwatch)}
       </#if>
       
       <#if plpFacetGroupVariantSticky?has_content>
          <#assign plpFacetGroupVariantSticky=plpFacetGroupVariantSticky.toUpperCase()/>
           ${setRequestAttribute("PLP_FACET_GROUP_VARIANT_STICKY",plpFacetGroupVariantSticky)}
       </#if>
       
       <#assign featureValueSelected=""/>
       ${setRequestAttribute("featureValueSelected",featureValueSelected)}

       <#if facetGroupMatch?has_content>
          <#assign facetGroupMatch=facetGroupMatch.toUpperCase()/>
           ${setRequestAttribute("FACET_GROUP_VARIANT_MATCH",facetGroupMatch)}
       </#if>
       
       <#if facetGroups?has_content && facetGroupMatch?has_content>
          <#list facetGroups as facet>
            <#if facetGroupMatch == facet.facet>
                <#assign featureValueSelected=facet.facetValue!""/>
                 ${setRequestAttribute("featureValueSelected",featureValueSelected)}
                <#break>
            </#if>
          </#list>
       </#if>
       
       <#if searchTextGroups?has_content && facetGroupMatch?has_content>
          <#list searchTextGroups as facet>
            <#if facetGroupMatch == facet.facet>
                <#assign featureValueSelected=facet.facetValue!""/>
                ${setRequestAttribute("featureValueSelected",featureValueSelected)}
                <#break>
            </#if>
          </#list>
       </#if>
       
       <#assign count = 1/>
       <h2>${uiLabelMap.RecentlyViewedProductHeading}</h2>
       <div class="boxList productList">
         <#list sessionAttributes.lastViewedProducts as productId>
           ${setRequestAttribute("plpItemId",productId)}
           <!-- DIV for Displaying Recommended productss STARTS here -->
           ${screens.render("component://osafe/widget/EcommerceDivScreens.xml#PDPRecentDivSequence")}
           <#if isPlpPdpInStoreOnly?exists>
               <script language="JavaScript" type="text/javascript">eval(checkProductInStorePlp('${isPlpPdpInStoreOnly}', '${uiSequenceScreen}_${productId}'));</script>
           </#if>
            ${virtualJavaScript?if_exists}
            ${virtualDefaultJavaScript?if_exists}
            <#-- Prefill first select box (virtual products only) -->
            <#if plpVariantTree?exists && 0 < plpVariantTree.size()>
              <#assign rowNo = 0/>
              <#list plpFeatureOrder as feature>
                  <#if rowNo == 0>
                      <script language="JavaScript" type="text/javascript">eval("list" + "${StringUtil.wrapString(feature)}_${uiSequenceScreen}_${plpProduct.productId}" + "()");</script>
                  <#else>
                      <script language="JavaScript" type="text/javascript">eval("listFT" + "${StringUtil.wrapString(feature)}_${uiSequenceScreen}_${plpProduct.productId}" + "()");</script>
                      <script language="JavaScript" type="text/javascript">eval("listLiFT" + "${StringUtil.wrapString(feature)}_${uiSequenceScreen}_${plpProduct.productId}" + "()");</script>
                  </#if>
              <#assign rowNo = rowNo + 1/>
              </#list> 
            </#if>
          <#if count == maxRecentlyViewedProducts?number>
            <#break>
          </#if>
          <#assign count = count+1/>
          <!-- DIV for Displaying PLP item ENDS here -->     
        </#list>
       </div>
    </div>
  </#if>
</li>