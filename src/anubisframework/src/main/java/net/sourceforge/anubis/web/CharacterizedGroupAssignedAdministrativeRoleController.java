package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characterizedgroupassignedadministrativerole", automaticallyMaintainView = true, formBackingObject = CharacterizedGroupAssignedAdministrativeRole.class)
@RequestMapping("/characterizedgroupassignedadministrativerole/**")
@Controller
public class CharacterizedGroupAssignedAdministrativeRoleController {
}
