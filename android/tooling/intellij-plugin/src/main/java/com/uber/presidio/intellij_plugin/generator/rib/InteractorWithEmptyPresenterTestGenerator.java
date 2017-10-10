package com.uber.presidio.intellij_plugin.generator.rib;

import com.uber.presidio.intellij_plugin.generator.Generator;

public class InteractorWithEmptyPresenterTestGenerator extends Generator {

  private static final String TEMPLATE_NAME =
      "RibInteractorWithEmptyPresenterTest.java.template";

  public InteractorWithEmptyPresenterTestGenerator(String packageName, String ribName) {
    super(packageName, ribName, TEMPLATE_NAME);
  }

  @Override
  public String getClassName() {
    return String.format("%sInteractorTest", getRibName());
  }
}