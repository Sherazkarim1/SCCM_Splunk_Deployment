# Simple Explanation of What We Did & What Happened

---

## 1. What We Did
- Created all the files needed to deploy Splunk Universal Forwarder using SCCM
- Set up the files with your company's Splunk server addresses:
  - Indexer: 10.150.10.11:9997
  - Deployment Server: 10.150.10.10:8089
- Tested everything on Mac first, then tested on Windows

---

## 2. What Just Happened
- We ran a test script on the Windows machine
- The script checked: "Is Splunk Universal Forwarder already installed?"
- Result: **NO, it's NOT installed**
- So this machine would be included in the group of computers that need Splunk
- The script showed us exactly what command SCCM would use to install it

---

## 3. What You Have
- A WQL query to create a collection in SCCM (only computers missing Splunk)
- The exact MSI command to install Splunk via SCCM
- All documentation and test scripts

---

## 4. Next Steps (When Ready)
1. In SCCM, create a new collection using the query in `SCCM_WQL_Query.txt`
2. Create an SCCM Application using the install command in `Splunk_Install_Command.txt`
3. Deploy the Application to the new Collection
