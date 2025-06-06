<?php defined('BX_DOL') or die('hack attempt');
/**
 * Copyright (c) UNA, Inc - https://una.io
 * MIT License - https://opensource.org/licenses/MIT
 *
 * @defgroup    Reputation Reputation
 * @ingroup     UnaModules
 *
 * @{
 */

class BxReputationTemplate extends BxBaseModNotificationsTemplate
{
    public function __construct(&$oConfig, &$oDb)
    {
        parent::__construct($oConfig, $oDb);
    }

    public function getBlockSummary($iProfileId)
    {
        $oProfile = BxDolProfile::getInstance($iProfileId);
        if(!$oProfile)
            return false;

        $aProfileInfo = $this->_oDb->getProfiles(['sample' => 'id', 'id' => $iProfileId]);
        $bProfileInfo = !empty($aProfileInfo) && is_array($aProfileInfo);
        $aProfileLevels = $this->_oDb->getLevels([
            'sample' => 'profile_id', 
            'profile_id' => $iProfileId
        ]);

        $oFunctions = BxTemplFunctions::getInstance();

        $aTmplVarsLevels = [];
        foreach($aProfileLevels as $aProfileLevel) {
            list($sIconFont, $sIconUrl, $sIconA, $sIconHtml) = $oFunctions->getIcon($aProfileLevel['icon']);
            $bIconFont = !empty($sIconFont);
            $bIconHtml = !empty($sIconHtml);

            $sTitle = _t($aProfileLevel['title']);

            $aTmplVarsLevels[] = !$this->_bIsApi ? [
                'bx_if:icon' => [
                    'condition' => $bIconFont || $bIconHtml,
                    'content' => [
                        'bx_if:icon_font' => [
                            'condition' => $bIconFont,
                            'content' => [
                                'icon' => $sIconFont
                            ]
                        ],
                        'bx_if:icon_html' => [
                            'condition' => $bIconHtml,
                            'content' => [
                                'icon' => $sIconHtml
                            ]
                        ],
                    ]
                ],
                'title' => $sTitle
            ] : [
                'icon' => $bIconHtml ? $sIconHtml : '',
                'title' => $sTitle
            ];
        }

        if($this->_bIsApi)
            return [
                bx_api_get_block('reputation_summary', [
                    'author_data' => BxDolProfile::getData($iProfileId),
                    'levels' => $aTmplVarsLevels,
                ])
            ];

        return $this->parseHtmlByName('block_summary.html', [
            'profile_image' => $oProfile->getUnit($iProfileId, ['template' => ['name' => 'unit_wo_info', 'size' => 'ava']]),
            'profile_name' => $oProfile->getDisplayName(),
            'points' => $bProfileInfo ? $aProfileInfo['points'] : 0,
            'bx_repeat:levels' => $aTmplVarsLevels
        ]);
    }

    public function getBlockLeaderboard($iDays = 0, $iLimit = 0)
    {
        $CNF = &$this->_oConfig->CNF;
        
        if(!$iLimit)
            $iLimit = (int)getParam($CNF['PARAM_LEADERBOARD_LIMIT']);

        $bGrowth = $iDays > 0;

        if($bGrowth) 
            $aItems = $this->_oDb->getEvents(['sample' => 'stats', 'days' => $iDays, 'limit' => $iLimit]);
        else
            $aItems = $this->_oDb->getProfiles(['sample' => 'stats', 'limit' => $iLimit]);

        $aTmplVarsProfiles = [];
        foreach($aItems as $iProfileId => $iPoints)
            if($iPoints != 0 && ($iProfileId = abs($iProfileId)) && ($oProfile = BxDolProfile::getInstance($iProfileId)) !== false)
                $aTmplVarsProfiles[] = [
                    'unit' => !$this->_bIsApi ? $oProfile->getUnit($iProfileId) : BxDolProfile::getData($oProfile),
                    'sign' => $bGrowth ? ($iPoints > 0 ? '+' : '-') : '',
                    'points' => $bGrowth ? abs($iPoints) : $iPoints
                ];

        if($this->_bIsApi)
            return [
                bx_api_get_block('reputation_leaderboard', [
                    'days' => $iDays,
                    'profiles' => $aTmplVarsProfiles
                ])
            ];

        $this->addCss(['main.css']);
        return $this->parseHtmlByName('block_leaderboard.html', [
            'bx_repeat:profiles' => $aTmplVarsProfiles
        ]);
    }
}

/** @} */
