package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "resource", automaticallyMaintainView = true, formBackingObject = Resource.class)
@RequestMapping("/resource/**")
@Controller
public class ResourceController {
}
