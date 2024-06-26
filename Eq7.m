classdef Eq7 < audioPlugin
    properties
        Gain1 = 0
        Freq1 = 100
        Q1 = 0.5
        Gain2 = 0
        Freq2 = 500
        Q2 = 0.5
        Gain3 = 0
        Freq3 = 1000
        Q3 = 0.5
        Gain4 = 0
        Freq4 = 2000
        Q4 = 0.5
        Gain5 = 0
        Freq5 = 4000
        Q5 = 0.5
        Gain6 = 0
        Freq6 = 10000
        Q6 = 0.5
        Gain7 = 0
        Freq7 = 14000
        Q7 = 0.5
        Volume = 1
        Enable = true
    end
   
    properties (Constant)
        PluginInterface = audioPluginInterface( ...
            audioPluginParameter('Gain1', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,2;4,2], ...                                    
                'DisplayName','Band1: Gain','DisplayNameLocation','Above'), ...    
            audioPluginParameter('Freq1', ...
                'Label','Hz', ...
                'Mapping',{'log',20,400}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,2], ...                                        
                'DisplayNameLocation','Above'), ...  
            audioPluginParameter('Q1', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,2], ...                                        
                'DisplayNameLocation','Above'), ...    
            audioPluginParameter('Gain2', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,3;4,3], ...                                    
                'DisplayName','Band2: Gain','DisplayNameLocation','Above'), ...                         
            audioPluginParameter('Freq2', ...
                'Label','Hz', ...
                'Mapping',{'log',400,700}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,3], ...                                        
                'DisplayNameLocation','Above'), ...  
            audioPluginParameter('Q2', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,3], ...                                        
                'DisplayNameLocation','Above'), ...  
            audioPluginParameter('Gain3', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,4;4,4], ...                                    
                'DisplayName','Band3: Gain','DisplayNameLocation','Above'), ...   
            audioPluginParameter('Freq3', ...
                'Label','Hz', ...
                'Mapping',{'log',700,1400}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,4], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Q3', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,4], ...                                        
                'DisplayNameLocation','Above'), ...  
            audioPluginParameter('Gain4', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,5;4,5], ...                                    
                'DisplayName','Band4: Gain','DisplayNameLocation','Above'), ... 
           audioPluginParameter('Freq4', ...
                'Label','Hz', ...
                'Mapping',{'log',1400,2800}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,5], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Q4', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,5], ...                                        
                'DisplayNameLocation','Above'), ...  
           audioPluginParameter('Gain5', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,6;4,6], ...                                    
                'DisplayName','Band5: Gain','DisplayNameLocation','Above'), ... 
           audioPluginParameter('Freq5', ...
                'Label','Hz', ...
                'Mapping',{'log',2800,5600}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,6], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Q5', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,6], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Gain6', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,7;4,7], ...                                    
                'DisplayName','Band6: Gain','DisplayNameLocation','Above'), ... 
           audioPluginParameter('Freq6', ...
                'Label','Hz', ...
                'Mapping',{'log',5600,11300}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,7], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Q6', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,7], ...                                        
                'DisplayNameLocation','Above'), ... 
           audioPluginParameter('Gain7', ...
                'Label','dB', ...
                'Mapping',{'lin',-20,20}, ...
                'Style','vslider', ...                                     
                'Layout',[2,8;4,8], ...                                    
                'DisplayName','Band7: Gain','DisplayNameLocation','Above'), ... 
           audioPluginParameter('Freq7', ...
                'Label','Hz', ...
                'Mapping',{'log',11300,20000}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[6,8], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Q7', ...
                'Label','', ...
                'Mapping',{'log',0.4,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,8], ...                                        
                'DisplayNameLocation','Above'), ... 
            audioPluginParameter('Volume', ...
                'Label','dB', ...
                'Mapping',{'lin',0,5}, ...
                'Style','rotaryknob', ...                                  
                'Layout',[8,1], ...                                        
                'DisplayName','Output Gain','DisplayNameLocation','Above'), ...                        
            audioPluginParameter('Enable', ...
                'Style','vrocker', ...                                     
                'Layout',[6,1], ...                                        
                'DisplayNameLocation','None'), ...                                            
                ...
            audioPluginGridLayout( ...                                     
                'RowHeight',[20,20,160,20,20,100,20,100], ...                        
                'ColumnWidth',[200,100,100,100,100,100,100,100]), ...
                ...
              'BackgroundImage','tlo_fin.png') 
    end
     properties (Access = private)
        mPEQ
    end
    methods
        function obj = Eq7
            obj.mPEQ = multibandParametricEQ('HasHighpassFilter',false, ...
                'HasLowShelfFilter',false,'HasHighShelfFilter',false, ...
                'HasLowpassFilter',false,'Oversample',false,'NumEQBands',7, ...
                'EQOrder',2);
        end
        function y = process(obj, x)
            if obj.Enable
                y = step(obj.mPEQ,x);
                y = y*obj.Volume;
            else
                y = x;
            end
        end
        function reset(obj)
            obj.mPEQ.SampleRate = getSampleRate(obj);
            reset(obj.mPEQ);
        end
        function set.Freq1(obj,val)
            obj.Freq1 = val;
            obj.mPEQ.Frequencies(1) = val; %#ok<*MCSUP>
        end
        function set.Gain1(obj,val)
            obj.Gain1 = val;
            obj.mPEQ.PeakGains(1) = val;
        end
        function set.Q1(obj,val)
            obj.Q1 = val;
            obj.mPEQ.QualityFactors(1) = val;
        end
        function set.Freq2(obj,val)
            obj.Freq2 = val;
            obj.mPEQ.Frequencies(2) = val;
        end
        function set.Gain2(obj,val)
            obj.Gain2 = val;
            obj.mPEQ.PeakGains(2) = val;         
        end
        function set.Q2(obj,val)
            obj.Q2 = val;
            obj.mPEQ.QualityFactors(2) = val;
        end
        function set.Freq3(obj,val)
            obj.Freq3 = val;
            obj.mPEQ.Frequencies(3) = val;
        end
        function set.Gain3(obj,val)
            obj.Gain3 = val;
            obj.mPEQ.PeakGains(3) = val;
        end
        function set.Q3(obj,val)
            obj.Q3 = val;
            obj.mPEQ.QualityFactors(3) = val;
        end
        function set.Freq4(obj,val)
            obj.Freq4 = val;
            obj.mPEQ.Frequencies(4) = val;
        end
        function set.Gain4(obj,val)
            obj.Gain4 = val;
            obj.mPEQ.PeakGains(4) = val;
        end
        function set.Q4(obj,val)
            obj.Q4 = val;
            obj.mPEQ.QualityFactors(4) = val;
        end
        function set.Freq5(obj,val)
            obj.Freq5 = val;
            obj.mPEQ.Frequencies(5) = val;
        end
        function set.Gain5(obj,val)
            obj.Gain5 = val;
            obj.mPEQ.PeakGains(5) = val;
        end
        function set.Q5(obj,val)
            obj.Q5 = val;
            obj.mPEQ.QualityFactors(5) = val;
        end
        function set.Freq6(obj,val)
            obj.Freq6 = val;
            obj.mPEQ.Frequencies(6) = val;
        end
        function set.Gain6(obj,val)
            obj.Gain6 = val;
            obj.mPEQ.PeakGains(6) = val;
        end
        function set.Q6(obj,val)
            obj.Q6 = val;
            obj.mPEQ.QualityFactors(6) = val;
        end
        function set.Freq7(obj,val)
            obj.Freq7 = val;
            obj.mPEQ.Frequencies(7) = val;
        end
        function set.Gain7(obj,val)
            obj.Gain7 = val;
            obj.mPEQ.PeakGains(7) = val;
        end
        function set.Q7(obj,val)
            obj.Q7 = val;
            obj.mPEQ.QualityFactors(7) = val;
        end
    end

end