<div class="cmp-examples-demo__top t-cmp-clean t-cmp-clean--light" >
<div class="cmp-examples-demo__component cmp-examples-demo__component--widthFull" >
[#assign imgID=content.image]
[#if imgID?? ]  
  [#assign img = damfn.getAsset(imgID) ]
  [#if img?has_content]
    [#assign imgInfo=damfn.getAssetMap(img)]
    [#assign title=content.title!imgInfo["title"]!"" ]
    
    [#assign description=cmsfn.decode(content).description!imgInfo["description"]]
    [#assign caption=imgInfo.caption!title ]
<div class="component" >
    <div class="teaser">
      <div  class="cmp-teaser" >
        <div class="cmp-teaser__image">
          <div  class="cmp-image" itemscope="" itemtype="http://schema.org/ImageObject">
          
				    <img  src="${img.link}" class="cmp-image__image"   alt="${caption}" title="${caption}" />
            <meta itemprop="caption" content="${caption}" />
          </div>
        </div>
        <div class="cmp-teaser__content">
          <h2 class="cmp-teaser__title">
              [#assign linkFieldName = "link" ]
              [#assign resolveError = false ]
              [#include "/demo/templates/includes/forLinkUrl.ftl"  ]
              [#if targetLink??]
                  <a class="cmp-teaser__title-link" data-cmp-clickable="" href="${targetLink}">${title}</a>
              [#elseif resolveError && cmsfn.editMode]
                  resolveError
              [#else]
                  ${title}
              [/#if]
          </h2>

          <div class="cmp-teaser__description">
            <p>${description}</p>
          </div>
          [#assign actions=content.actions!]
          [#if actions??]
          [#assign actionList=cmsfn.children(actions,"mgnl:contentNode")]
          <div class="cmp-teaser__action-container"> 
            [#list actionList as action ]
                [#assign actionTarget = cmsfn.contentByPath(action.actionLink, "website")!]
                [#if actionTarget??]
                    [#assign url = cmsfn.link(actionTarget)]
                    <a class="cmp-teaser__action-link"  href="${url}">${action.title!actionTarget.title}</a>
                [/#if]
            [/#list]
          </div>
          [/#if]
        </div>
      </div>
    </div>
  [/#if]

[#else]
  <br>no content
[/#if]
</div>
</div>
</div>