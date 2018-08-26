package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characterizedgroupassignedcommonrole", automaticallyMaintainView = true, formBackingObject = CharacterizedGroupAssignedCommonRole.class)
@RequestMapping("/characterizedgroupassignedcommonrole/**")
@Controller
public class CharacterizedGroupAssignedCommonRoleController {
}
