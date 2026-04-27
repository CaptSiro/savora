<?php

namespace components\Home;

use components\core\HtmlHead\HtmlHead;
use components\core\Menu\Menu;
use components\core\WebPage\ContextAwareWebPage;
use components\docs\Docs;
use core\App;
use core\RouteChasmEnvironment;
use core\view\ContainerContent;
use models\core\Page\Page;
use models\core\Setting\Setting;
use const models\extensions\Editable\PROPERTY_EDITABLE;

class Home extends ContainerContent {
    protected Menu $menu;

    public const LEXICON_GROUP = 'home';



    public function __construct() {
        parent::__construct(
            new ContextAwareWebPage(
                head: new HtmlHead(
                    App::getEnvStatic()->get(RouteChasmEnvironment::ENV_PROJECT) ?? 'RouteChasm'
                )
            )
        );

        $this->setLexiconGroup(self::LEXICON_GROUP);
    }



    public function createDocsLink(): ?string {
        $docs = Docs::getInstance();
        if (!$docs->isBound()) {
            return null;
        }

        return $docs
            ->createUrl()
            ->toString();
    }

    public function getProjectLink(): ?string {
        return App::getEnvStatic()
            ->get(RouteChasmEnvironment::ENV_PROJECT_LINK);
    }

    public function getProjectName(): ?string {
        return App::getEnvStatic()
            ->get(RouteChasmEnvironment::ENV_PROJECT) ?? 'RouteChasm';
    }

    public function getCategoryPage(): ?Page {
        $pageId = Setting::fromName(
            'savora:homepage-categories-page-id',
            true,
            1,
            [PROPERTY_EDITABLE => true]
        )->toInt();

        return Page::fromId($pageId);
    }

    /**
     * @return array<Page>
     */
    public function getFeaturedPages(): array {
        $limit = Setting::fromName(
            'savora:homepage-featured-pages-count',
            true,
            3,
            [PROPERTY_EDITABLE => true]
        )->toInt();

        return Page::lastUpdated(limit: $limit);
    }
}