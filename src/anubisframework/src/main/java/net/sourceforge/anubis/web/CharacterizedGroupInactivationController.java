package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacterizedGroupInactivation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characterizedgroupinactivation", automaticallyMaintainView = true, formBackingObject = CharacterizedGroupInactivation.class)
@RequestMapping("/characterizedgroupinactivation/**")
@Controller
public class CharacterizedGroupInactivationController {
}
