//  Created by xudong wu on 02/03/2017.
//  Copyright © 2017 wuxudong. All rights reserved.
//

import Foundation

import SwiftyJSON
import Charts

class RadarDataExtract : DataExtract {
    override func createData() -> ChartData {
        return RadarChartData();
    }
    
    override func createDataSet(_ entries: [ChartDataEntry]?, label: String?) -> IChartDataSet {
        return RadarChartDataSet(entries : entries, label: label)
    }
    
    override func dataSetConfig(_ dataSet: IChartDataSet, config: JSON) {
        let radarDataSet = dataSet as! RadarChartDataSet
        
        ChartDataSetConfigUtils.commonConfig(radarDataSet, config: config);
        ChartDataSetConfigUtils.commonBarLineScatterCandleBubbleConfig(radarDataSet, config: config);
        ChartDataSetConfigUtils.commonLineRadarConfig(radarDataSet, config: config);
        ChartDataSetConfigUtils.commonRadarConfig(radarDataSet, config: config);
    }
    
    override func createEntry(_ values: [JSON], index: Int) -> RadarChartDataEntry {
        var entry: RadarChartDataEntry;
        
        
        let item = values[index];
        
        if item.dictionary != nil {
            let dict = item;
            
            if dict["value"].double != nil {
                entry = RadarChartDataEntry(value: dict["value"].doubleValue, data: dict as AnyObject?);
            }  else {
                fatalError("invalid data " + values.description);
            }
            
        } else if item.double != nil {
            entry = RadarChartDataEntry(value: item.doubleValue);
        } else {
            fatalError("invalid data " + values.description);
        }
        
        return entry;
    }
}
