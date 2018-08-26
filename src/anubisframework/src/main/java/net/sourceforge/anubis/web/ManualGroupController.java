package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ManualGroup;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "manualgroup", automaticallyMaintainView = true, formBackingObject = ManualGroup.class)
@RequestMapping("/manualgroup/**")
@Controller
public class ManualGroupController {
}
