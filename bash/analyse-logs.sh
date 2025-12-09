#!/bin/bash
LOG_DIR="/c/_WS/personal/linux-cmds/bash"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="log_analysis_report.txt"

echo -e "\n===========================================================" > "$REPORT_FILE"
echo "==== Analysing log files in $LOG_DIR directory ====" >> "$REPORT_FILE"
echo "===========================================================" >> "$REPORT_FILE"

echo -e "\n### List of log files updated in last 24 hours ###" >> "$REPORT_FILE"
LOG_FILES=$(find "$LOG_DIR" -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"


# Loop through each log file
for LOG_FILE in $LOG_FILES; do
    echo -e "\n===================================================" >> "$REPORT_FILE"
    echo "============ $LOG_FILE ============" >> "$REPORT_FILE"
    echo "===================================================" >> "$REPORT_FILE"

    for ERROR_PATTERN in "${ERROR_PATTERNS[@]}"; do
        echo -e "\n### searching ${ERROR_PATTERN} logs in $LOG_FILE ###" >> "$REPORT_FILE"
        grep "${ERROR_PATTERN}" "$LOG_FILE" >> "$REPORT_FILE"
        echo -e "\n### Number of ${ERROR_PATTERN} logs found ###" >> "$REPORT_FILE"
        ERROR_COUNT=$(grep -c "${ERROR_PATTERN}" "$LOG_FILE")
        echo ERROR_COUNT >> "$REPORT_FILE"

        if [ "$ERROR_COUNT" -gt 0 ]; then
            echo -e "\nAction required: too many ${ERROR_PATTERN} logs found in $LOG_FILE" 
        fi
    done
done

echo -e "\n### Log analysis completed ### report saved to $REPORT_FILE"

