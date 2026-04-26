<?php

namespace models\core\Setting;

use components\core\Admin\Nexus\NexusProxy;
use models\extensions\Editable\EditableProxy;

class SettingProxy extends NexusProxy {
    use EditableProxy;

    protected function getEditValue(): string {
        if (!$this->isItemEditable()) {
            return '';
        }

        return parent::getEditValue();
    }

    protected function getDeleteValue(): string {
        if (!$this->isItemEditable()) {
            return '';
        }

        return parent::getDeleteValue();
    }
}