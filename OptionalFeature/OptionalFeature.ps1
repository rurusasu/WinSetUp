# Windowsのオプショナルフィーチャーを設定する関数
function Set-OptionalFeature {
    # パラメータとしてJSONオブジェクトを受け取る
    param (
        [psobject]$featureConfig
    )
    # オプショナルフィーチャーの設定に従って有効化または無効化する
    foreach ($featureConfig in $featureConfig.Features) {
        # 設定からフィーチャー名と状態を取得する
        $featureName = $featureConfig.FeatureName
        $featureState = $featureConfig.State

        # 現在のフィーチャーの状態を取得する
        $feature = Get-WindowsOptionalFeature -Online -FeatureName $featureName
        # 現在の状態と設定された状態が異なる場合
        if ($feature.State -ne $featureState) {
            # 変更前後の状態を表示する
            Write-Host $feature.FeatureName":" $feature.State "->" $featureName":" $featureState -ForegroundColor Yellow
            # 設定された状態がEnabledならば
            if($featureState -eq "Enabled") {
                # フィーチャーを有効化する（再起動なし）
                Enable-WindowsOptionalFeature -Online -FeatureName $featureName -NoRestart
            } else {
                # フィーチャーを無効化する（再起動なし）
                Disable-WindowsOptionalFeature -Online -FeatureName $featureName -NoRestart
            }
        }
    }
}