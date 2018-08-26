package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacterizedGroupTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characterizedgrouptranslation", automaticallyMaintainView = true, formBackingObject = CharacterizedGroupTranslation.class)
@RequestMapping("/characterizedgrouptranslation/**")
@Controller
public class CharacterizedGroupTranslationController {
}
