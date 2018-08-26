package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.UserCharacteristicValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "usercharacteristicvalue", automaticallyMaintainView = true, formBackingObject = UserCharacteristicValue.class)
@RequestMapping("/usercharacteristicvalue/**")
@Controller
public class UserCharacteristicValueController {
}
