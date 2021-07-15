[#assign pageID= swValue.page ]
[#assign target = cmsfn.contentByPath(pageID, "website")!]

[#-- Ensure target node exists and it's not deleted --]
[#if target?has_content && !cmsfn.asJCRNode(target).hasProperty("mgnl:deleted")]

    [#assign targetLink = cmsfn.link(target)!"_blank"]

    [#if !title?has_content]
        [#assign title = target.title!target.@name!]
    [/#if]

    [#if !targetLink?has_content || !target?has_content]
        [#assign resolveError = true]
    [/#if]

[#else]
    [#assign resolveError = true]
[/#if]
